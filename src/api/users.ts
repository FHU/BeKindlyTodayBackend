// users.ts - The router for the users model in our API

// Import dependencies
import express, { Response } from 'express';
import { PrismaClient } from '@prisma/client';
import { jwtVerify } from '@kinde-oss/kinde-node-express';
import getUser from '../services/UserServices';
import { computeStreak } from '../ComputeStreaks';
import { inDev } from '../Config';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

const users = express.Router();

const prisma = new PrismaClient();

if (!inDev) {
  users.use(verifier);
}

users.get('/', async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json(user);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.get('/stats', async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      res.status(404).json({ message: 'User not found' });
      return;
    }

    const userCompletions = await prisma.completion.findMany({
      where: { userId: user.id },
    });

    const userCompletionsCount = userCompletions.length;

    const userStreak = computeStreak(userCompletions);

    res.json({ userCompletionsCount, userStreak });
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/bio', async (req, res) => {
  const bio = req.body.bio;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        bio,
      },
      select: {
        id: true,
        username: true,
        bio: true,
        profilePicture: true,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/profilepicture', async (req, res) => {
  const profilePicture = req.body.profilePicture;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        profilePicture: profilePicture,
      },
      select: {
        id: true,
        username: true,
        bio: true,
        profilePicture: true,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/username', async (req, res) => {
  const username = req.body.username;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: 'User not found' });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        username,
      },
      select: {
        id: true,
        username: true,
        bio: true,
        profilePicture: true,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Export the router for use in the app.
export default users;
