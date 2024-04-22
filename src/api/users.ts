// users.ts - The router for the users model in our API

// Import dependencies
import express from 'express';
import { PrismaClient } from '@prisma/client';
import { jwtVerify, getUser } from '@kinde-oss/kinde-node-express';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create the router
const users = express.Router();

const prisma = new PrismaClient();

// Routes go here (get, post, put, delete)

if (process.env.ENVIRONMENT !== 'dev') {
  users.use(verifier, getUser);
}

users.get('/', async (req, res) => {
  console.log(req.user);
  try {
    const users = await prisma.user.findMany();

    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Export the router for use in the app.
export default users;
