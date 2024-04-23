// completions.ts - Router for the completions model

// Import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';
import getUser from '../services/UserServices';
import { jwtVerify } from '@kinde-oss/kinde-node-express';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

if (process.env.ENVIRONMENT !== 'dev') {
  completions.use(verifier);
}

// Get all completions that pass filter
completions.get('/', async (req, res) => {
  try {
    const completions = await prisma.completion.findMany();

    // Return the completions
    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get the count of completions that pass a filter
completions.get('/stats', async (req, res) => {
  console.log('here');
  try {
    const DAY_IN_MS = 86400000;

    const start_of_challenge_day =
      new Date().toISOString().slice(0, 10) + 'T00:00:00.000Z';

    const end_of_challenge_day = new Date(
      new Date(start_of_challenge_day).getTime() + DAY_IN_MS
    );

    // get the user id from the request body
    const user_id = (await getUser(req)).id;

    // get the world completions and the daily world completions counts
    const world_completions_count = await prisma.completion.count();
    const world_daily_completions_count = await prisma.completion.count({
      where: {
        date: {
          gte: start_of_challenge_day,
          lte: end_of_challenge_day,
        },
      },
    });

    // get the user's completions count
    const user_completions_count = await prisma.completion.count({
      where: { user_id },
    });

    // Create the response body
    const response_body = {
      world_completions_count,
      world_daily_completions_count,
      user_completions_count,
    };

    // Return the count
    res.json(response_body);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get completion based on id
completions.get('/:id', async (req, res) => {
  try {
    // declare variable for completion's id
    const completion_id = parseInt(req.params.id);

    // Parse the id parameter provided to filter out bad request
    if (Number.isNaN(completion_id)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    // Get the completion from the database
    const completion = await prisma.completion.findUnique({
      where: { id: completion_id },
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
    const user_id = (await getUser(req)).id;

    // Create object to query completions based on user id an challenge id
    const challenge_id = challenge.id;

    console.log(`userid:${user_id} challengeid:${challenge_id}`);

    // Check for existing completions
    const completion = await prisma.completion.findUnique({
      where: {
        user_id_challenge_id: {
          user_id,
          challenge_id,
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
    const new_completion = await prisma.completion.create({
      data: {
        challenge_id,
        user_id,
        description,
      },
    });

    res.json(new_completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

completions.delete('/:id', async (req, res) => {
  try {
    // get completion id from parameters
    const completion_id = parseInt(req.params.id);

    // Check that the id can be parsed to an integer, return 400 error for bad requests
    if (Number.isNaN(completion_id)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    //check for deletion (I know this is bad but its a bandaid)
    const completion = await prisma.completion.findUnique({
      where: { id: completion_id },
    });

    if (completion === null) {
      return res.status(404).json({ message: 'Completion not found' });
    }

    // delete the requested resource
    await prisma.completion.delete({ where: { id: completion_id } });

    res.sendStatus(204);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

export default completions;
