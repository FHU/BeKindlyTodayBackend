// completions.ts - Router for the completions model

// Import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';
import getUser from '../services/UserServices';
import { jwtVerify } from '@kinde-oss/kinde-node-express';
import { computeStreak } from '../ComputeStreaks';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

completions.get('/unauth_stats', async (req, res) => {
  try {
    const DAY_IN_MS = 86400000;

    const startOfChallengeDay =
      new Date().toISOString().slice(0, 10) + 'T00:00:00.000Z';

    const endOfChallengeDay = new Date(
      new Date(startOfChallengeDay).getTime() + DAY_IN_MS
    );

    // get the world completions and the daily world completions counts
    const worldCompletionsCount = await prisma.completion.count();
    const worldDailyCompletionsCount = await prisma.completion.count({
      where: {
        date: {
          gte: startOfChallengeDay,
          lte: endOfChallengeDay,
        },
      },
    });

    const responseBody = {
      worldCompletionsCount,
      worldDailyCompletionsCount,
      userCompletionsCount: 0, //TODO change fronte end to not require this
    };

    res.status(200).json(responseBody);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

if (process.env.ENVIRONMENT !== 'dev') {
  completions.use(verifier);
}

// Get all completions that pass filter
completions.get('/', async (req, res) => {
  try {
    const completions = await prisma.completion.findMany({
      select: {
        id: true,
        description: true,
        date: true,
        userId: true,
        challengeId: true,
        completedTwist: true,
      },
    });

    // Return the completions
    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get the count of completions that pass a filter
completions.get('/stats', async (req, res) => {
  try {
    const DAY_IN_MS = 86400000;

    const startOfChallengeDay =
      new Date().toISOString().slice(0, 10) + 'T00:00:00.000Z';

    const endOfChallengeDay = new Date(
      new Date(startOfChallengeDay).getTime() + DAY_IN_MS
    );

    // get the user id from the request body
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const userId = user.id;

    // get the world completions and the daily world completions counts
    const worldCompletionsCount = await prisma.completion.count();
    const worldDailyCompletionsCount = await prisma.completion.count({
      where: {
        date: {
          gte: startOfChallengeDay,
          lte: endOfChallengeDay,
        },
      },
    });

    // get the user's completions count
    const userCompletionsCount = await prisma.completion.count({
      where: { userId },
    });

    // Create the response body
    const responseBody = {
      worldCompletionsCount,
      worldDailyCompletionsCount,
      userCompletionsCount,
    };

    // Return the count
    res.json(responseBody);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.get('/calendar', async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      res.status(404).json({ message: '404 User Not found' });
      return;
    }

    const userId = user.id;

    const userCompletions = await prisma.completion.findMany({
      where: { userId },
    });

    const completionDates = userCompletions.map(
      (completion) => completion.date
    );

    const userStreak = computeStreak(userCompletions);

    res.status(200).json({ completionDates, userStreak });
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.get('/today', async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      res.status(404).json({ message: 'User not found' });
      return;
    }

    const userId = user.id;

    const challenge = await prisma.challenge.findUnique({
      where: { date: new Date().toISOString() },
    });

    if (challenge === null) {
      res.status(404).json({ message: 'No challenge found for today' });
      return;
    }

    const challengeId = challenge.id;

    const completion = await prisma.completion.findUnique({
      where: {
        userId_challengeId: {
          userId,
          challengeId,
        },
      },
      select: {
        id: true,
        description: true,
        date: true,
        userId: true,
        challengeId: true,
        completedTwist: true,
      },
    });

    res.status(200).json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.get('/all_today', async (req, res) => {
  try {
    const challenge = await prisma.challenge.findUnique({
      where: { date: new Date().toISOString() },
    });

    if (challenge === null) {
      res.status(404).json({ message: 'No challenge found for today' });
      return;
    }

    const challengeId = challenge.id;

    const completions = await prisma.completion.findMany({
      where: {
        challengeId,
      },
      include: {
        user: {
          select: { id: true, username: true, bio: true, profilePicture: true },
        },
      },
    });

    res.status(200).json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get completion based on id
completions.get('/:id', async (req, res) => {
  try {
    // declare variable for completion's id
    const completionId = parseInt(req.params.id);

    // Parse the id parameter provided to filter out bad request
    if (isNaN(completionId)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    // Get the completion from the database
    const completion = await prisma.completion.findUnique({
      where: { id: completionId },
      select: {
        id: true,
        description: true,
        date: true,
        userId: true,
        challengeId: true,
        completedTwist: true,
      },
    });

    // Check for 404 errors
    if (completion === null) {
      res.status(404).json({ message: 'Not Found' });
      return;
    }

    // Send the json object of the completion
    res.json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Post method for completions
completions.post('/', async (req, res) => {
  try {
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString(),
      },
    });

    // Check that the challenge was found
    if (challenge === null) {
      res.status(404).json({ message: 'No challenge found for current date.' });
      return;
    }

    // Get the user id from the request
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const userId = user.id;

    // Create object to query completions based on user id an challenge id
    const challengeId = challenge.id;

    // Check for existing completions
    const completion = await prisma.completion.findUnique({
      where: {
        userId_challengeId: {
          userId,
          challengeId,
        },
      },
    });

    // Redirecting doesnt make sense since we have already fetched the completion from the backend.
    if (completion !== null) {
      return res.status(303).redirect(`/api/v1/completions/${completion.id}`);
    }

    // Get the description from the request
    const { description } = req.body;

    // Create the new completion
    const newCompletion = await prisma.completion.create({
      data: {
        challengeId,
        userId,
        description,
      },
      select: {
        id: true,
        description: true,
        date: true,
        userId: true,
        challengeId: true,
        completedTwist: true,
      },
    });

    return res.json(newCompletion);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.delete('/:id', async (req, res) => {
  try {
    // get completion id from parameters
    const completionId = parseInt(req.params.id);

    // Check that the id can be parsed to an integer, return 400 error for bad requests
    if (isNaN(completionId)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    // delete the requested resource
    try {
      await prisma.completion.delete({ where: { id: completionId } });
    } catch (err) {
      return res.status(404).json({ message: 'Error - user not found' });
    }

    res.sendStatus(204);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

export default completions;
