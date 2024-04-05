// users.ts - The router for the users model in our API

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

// Create the router
const users = express.Router();

const prisma = new PrismaClient();

// Routes go here (get, post, put, delete)

// TODO Update this route after changes to schema are pulled in
users.use("/memories", async (req, res) => {
  try {
    // Find all user_completions for the current user. Include the completion model for each user_completion
    const user_completions = await prisma.user_completions.findMany({
      where: {
        user_id: req.body.user.id,
      },
      include: { completion: true },
    });

    const completions = user_completions.map((user_completion) => {
      return user_completion.completion;
    });

    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal server error." });
  }
});

// Export the router for use in the app.
export default users;
