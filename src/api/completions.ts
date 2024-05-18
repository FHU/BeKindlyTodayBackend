// completions.ts - Router for the completions model

// Import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';
import getUser from '../services/UserServices';
import { jwtVerify } from '@kinde-oss/kinde-node-express';
import { computeStreak } from '../ComputeStreaks';
import { inDev, kindeConfig } from '../Config';

const verifier = jwtVerify(kindeConfig.issuerBaseUrl!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

const completions = express.Router();

const prisma = new PrismaClient();

completions.get('/unauth_stats', async (req, res) => {
  try {
    const DAY_IN_MS = 86400000;

    const startOfChallengeDay =
      new Date().toISOString().slice(0, 10) + 'T00:00:00.000Z';

    const endOfChallengeDay = new Date(
      new Date(startOfChallengeDay).getTime() + DAY_IN_MS
    );

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

if (!inDev) {
  completions.use(verifier);
}

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

    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.get('/stats', async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const userId = user.id;

    const DAY_IN_MS = 86400000;

    const startOfChallengeDay =
      new Date().toISOString().slice(0, 10) + 'T00:00:00.000Z';

    const endOfChallengeDay = new Date(
      new Date(startOfChallengeDay).getTime() + DAY_IN_MS
    );

    const worldCompletionsCount = await prisma.completion.count();
    const worldDailyCompletionsCount = await prisma.completion.count({
      where: {
        date: {
          gte: startOfChallengeDay,
          lte: endOfChallengeDay,
        },
      },
    });

    const userCompletionsCount = await prisma.completion.count({
      where: { userId },
    });

    const responseBody = {
      worldCompletionsCount,
      worldDailyCompletionsCount,
      userCompletionsCount,
    };

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

completions.get('/:id', async (req, res) => {
  try {
    const completionId = parseInt(req.params.id);

    if (isNaN(completionId)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

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

    if (completion === null) {
      res.status(404).json({ message: 'Not Found' });
      return;
    }

    res.json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.post('/', async (req, res) => {
  try {
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString(),
      },
    });

    if (challenge === null) {
      res.status(404).json({ message: 'No challenge found for current date.' });
      return;
    }

    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const userId = user.id;

    const challengeId = challenge.id;

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

    const { description } = req.body;

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
    const completionId = parseInt(req.params.id);

    if (isNaN(completionId)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

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
