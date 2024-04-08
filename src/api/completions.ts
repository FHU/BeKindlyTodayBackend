// completions.ts - Router for the completions model

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";
import { Completion } from "@prisma/client";

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

async function filter_completions(
  filter: string | undefined,
  user_id: number
): Promise<Completion[]> {
  let completions: Completion[];

  // No filter is same as filter for 'all'
  if (filter === undefined || filter === "all") {
    completions = await prisma.completion.findMany(); // Find all completions

    // Filter completions for today's challenge
  } else if (filter === "today") {
    // Get today's challenge
    const challenge = await prisma.challenge.findUnique({
      where: { date: new Date().toISOString().slice(0, 10) },
    });

    // Return empty list if no challenge for today.
    if (challenge === null) {
      return [];
    }

    // Find completions based on challenge
    completions = await prisma.completion.findMany({ where: { challenge } });

    // Filter completions for logged in user
  } else if (filter === "user") {
    // Find completions based on user
    completions = await prisma.completion.findMany({ where: { user_id } });
  } else {
    completions = []; // Don't know why ts doesn't recognize that completions is defined without this else statement.
  }

  return completions;
}

// Get all completions that pass filter
completions.get("/", async (req, res) => {
  try {
    // Get filter from request query
    const filter = req.query.filter;

    // Get the user id from the request
    const user_id = parseInt(req.body.user.id);

    // Ensure filter matches allowed values
    if (!["all", "today", "user", undefined].includes(filter?.toString())) {
      res.status(400).json({
        message:
          "Bad Request. Filter, if included, must be 'all', 'user', or 'today'",
      });
      return;
    }

    // Get the completions based on the filter
    const completions = await filter_completions(filter?.toString(), user_id);

    // Return the completions
    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Get the count of completions that pass a filter
completions.get("/count", async (req, res) => {
  try {
    // Get filter from request query
    const filter = req.query.filter;

    // Get user id from request body
    const user_id = parseInt(req.body.user.id);

    // Check that filter matches allowed filters
    if (!["all", "today", "user", undefined].includes(filter?.toString())) {
      res.status(400).json({
        message:
          "Bad Request. Filter, if included, must be 'all', 'user', or 'today'",
      });
      return;
    }

    // Get completions and count the number
    const completions = await filter_completions(filter?.toString(), user_id);
    const count = completions.length;

    // Return the count
    res.json({ count });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

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
