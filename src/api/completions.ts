// completions.ts - Router for the completions model

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";
import getUser from "../services/UserServices";
import { jwtVerify } from "@kinde-oss/kinde-node-express";

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: "", //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create router
const completions = express.Router();

// Create prisma client
const prisma = new PrismaClient();

completions.get("/unauth_stats", async (req, res) => {
  try {
    const DAY_IN_MS = 86400000;

    const start_of_challenge_day =
      new Date().toISOString().slice(0, 10) + "T00:00:00.000Z";

    const end_of_challenge_day = new Date(
      new Date(start_of_challenge_day).getTime() + DAY_IN_MS
    );
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
    const response_body = {
      world_completions_count,
      world_daily_completions_count,
      user_completions_count: 0,
    };

    res.status(200).json(response_body);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Get all completions that pass filter
completions.get("/", verifier, async (req, res) => {
  try {
    const completions = await prisma.completion.findMany();

    // Return the completions
    res.json(completions);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Get the count of completions that pass a filter
completions.get("/stats", verifier, async (req, res) => {
  try {
    const DAY_IN_MS = 86400000;

    const start_of_challenge_day =
      new Date().toISOString().slice(0, 10) + "T00:00:00.000Z";

    const end_of_challenge_day = new Date(
      new Date(start_of_challenge_day).getTime() + DAY_IN_MS
    );

    // get the user id from the request body
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    const user_id = user.id;

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
    res.status(500).json({ message: "Internal Server Error" });
  }
});

completions.get("/today", async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      res.status(404).json({ message: "User not found" });
      return;
    }

    const user_id = user.id;

    const challenge = await prisma.challenge.findUnique({
      where: { date: new Date().toISOString() },
    });

    if (challenge === null) {
      res.status(404).json({ message: "No challenge found for today" });
      return;
    }

    const challenge_id = challenge.id;

    const completion = await prisma.completion.findUnique({
      where: {
        user_id_challenge_id: {
          user_id,
          challenge_id,
        },
      },
    });

    res.status(200).json(completion);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Get completion based on id
completions.get("/:id", verifier, async (req, res) => {
  try {
    // declare variable for completion's id
    const completion_id = parseInt(req.params.id);

    // Parse the id parameter provided to filter out bad request
    if (Number.isNaN(completion_id)) {
      res.status(400).json({ message: "Bad Request, ids must be integers" });
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
completions.post("/", verifier, async (req, res) => {
  try {
    const challenge = await prisma.challenge.findUnique({
      where: {
        date: new Date().toISOString(),
      },
    });

    // Check that the challenge was found
    if (challenge === null) {
      res.status(404).json({ message: "No challenge found for current date." });
      return;
    }

    // Get the user id from the request
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    const user_id = user.id;

    // Create object to query completions based on user id an challenge id
    const challenge_id = challenge.id;

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
    res.status(500).json({ message: "Internal Server Error" });
  }
});

completions.delete("/:id", verifier, async (req, res) => {
  try {
    // get completion id from parameters
    const completion_id = parseInt(req.params.id);

    // Check that the id can be parsed to an integer, return 400 error for bad requests
    if (Number.isNaN(completion_id)) {
      res.status(400).json({ message: "Bad Request, ids must be integers" });
      return;
    }

    // delete the requested resource
    try {
      await prisma.completion.delete({ where: { id: completion_id } });
    } catch (err) {
      res.status(404).json({ message: "Error - user not found" });
    }

    res.sendStatus(204);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default completions;
