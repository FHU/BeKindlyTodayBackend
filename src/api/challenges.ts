// challenges.ts - Router for the challenges model

// import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';

const challenges = express.Router();

const prisma = new PrismaClient();

// Might be unnecessary with current frontend requirements
challenges.use('/:id/*', async (req, res, next) => {
  try {
    const id = parseInt(req.params.id);

    if (isNaN(id)) {
      res.status(400).json({ message: 'Bad Request, ids must be integers' });
      return;
    }

    const challenge = await prisma.challenge.findUnique({
      where: { id: id },
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

    if (challenge === null) {
      res
        .status(404)
        .json({ message: `Not Found, requested resource was not found` });
      return;
    }

    req.body.challenge = challenge;
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
    return;
  }

  next();
});

challenges.get('/today', async (req, res) => {
  try {
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

    if (challenge === null) {
      res.status(404).json({
        message: 'Not Found: No challenge has been created for today.',
      });
      return;
    }

    res.json(challenge);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

export default challenges;
