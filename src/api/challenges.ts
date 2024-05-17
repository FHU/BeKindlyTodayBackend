// challenges.ts - Router for the challenges model

// import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';
import { jwtVerify } from '@kinde-oss/kinde-node-express';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

const challenges = express.Router();

const prisma = new PrismaClient();

// Might be unnecessary with current frontend requirements
// Example middleware to filter out 404 errors early
challenges.use('/:id/*', async (req, res, next) => {
  try {
    // Try to parse the id into a number, if it is NaN, return 400 error
    const id = parseInt(req.params.id);
    if (Number.isNaN(id)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    // Once the id is parsed, retrieve the corresponding challenge from the database
    // If no challenges have a matching id, return a 404 error and return to stop execution.

    let challenge;
    challenge = await prisma.challenge.findUnique({ where: { id: id } });

    if (challenge === null) {
      res
        .status(404)
        .json({ message: `Not Found, requested resource was not found` });
      return;
    }

    // Add the requested challenge to the body of the request
    req.body.challenge = challenge;
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
    return;
  }

  // Use the next function to continue to the next matching route handler
  next();
});

// Endpoints are defined here
// Get the daily challenge
challenges.get('/today', async (req, res) => {
  try {
    // Find the challenge in the database with the date that matches today's date.
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString(),
      },
      select: {
        id: true,
        prompt: true,
        spanishPrompt: true,
        twist: true,
        spanishTwist: true,
        date: true,
        image: true,
      },
    });

    // If there is no challenge with the correct date, send a 404 error
    if (challenge === null) {
      res.status(404).json({
        message: 'Not Found: No challenge has been created for today.',
      });
      return;
    }

    // Send challenge as response
    res.json(challenge);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

export default challenges;
