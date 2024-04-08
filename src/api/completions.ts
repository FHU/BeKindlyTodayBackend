// completions.ts - Router for the completions model

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

completions.post("/", async (req, res) => {
  try {
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString().slice(0, 10),
      },
    });

    if (challenge === null) {
      res.status(404).json({ message: "No challenge found for current date." });
      return;
    }

    const { user_id } = req.body.user; // FIXME Figure out how Kinde will integrate then change this to find the user or user id
    const challenge_id = challenge.id;

    const user_id_challenge_id = { user_id, challenge_id };

    const completion = await prisma.completion.findUnique({
      where: { user_id_challenge_id },
    });

    if (completion !== null) {
      res
        .setHeader("location", `api/v1/completions/${completion.id}`)
        .sendStatus(303);
      return;
    }

    res.json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default completions;
