// completions.ts - Router for the completions model

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

// Get completion based on id
completions.get("/:id", async (req, res) => {
  try {
    // declare variable for completion's id
    let completion_id;

    // Parse the id parameter provided to filter out bad request
    try {
      completion_id = parseInt(req.params.id);
    } catch (err) {
      res
        .status(400)
        .json({ message: "Bad request. Id parameters must be integers." });
      return;
    }

    // Get the completion from the database
    const completion = await prisma.completion.findUnique({
      where: { id: completion_id },
    });

    // Check for 404 errors
    if (completion === null) {
      res.status(404).json({ message: "Not Found" });
      return;
    }

    // Send the json object of the completion
    res.json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Post method for completions
completions.post("/", async (req, res) => {
  try {
    // Get the daily challenge
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString().slice(0, 10),
      },
    });

    // Check that the challenge was found
    if (challenge === null) {
      res.status(404).json({ message: "No challenge found for current date." });
      return;
    }

    // Get the user id from the request
    const { user_id } = req.body.user; // FIXME Figure out how Kinde will integrate then change this to find the user or user id

    // Create object to query completions based on user id an challenge id
    const challenge_id = challenge.id;
    const user_id_challenge_id = { user_id, challenge_id };

    // Check for existing completions
    const completion = await prisma.completion.findUnique({
      where: { user_id_challenge_id },
    });

    // Redirect to existing completion if it already exists
    if (completion !== null) {
      res
        .setHeader("location", `api/v1/completions/${completion.id}`)
        .sendStatus(303);
      return;
    }

    // Get the description from the request
    const { description } = req.body;

    // Create the new completion
    const new_completion = await prisma.completion.create({
      data: {
        challenge_id,
        user_id,
        description,
        date: new Date(), // Set date to current date & time
      },
    });

    res.json(new_completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default completions;
