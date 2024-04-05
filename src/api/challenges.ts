// challenges.ts - Router for the challenges model

// import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

const challenges = express.Router();

const prisma = new PrismaClient();

// Might be unnecessary with current frontend requirements
// Example middleware to filter out 404 errors early
challenges.use("/:id/*", async (req, res, next) => {
  // Create variable for the id
  let id: number;

  // Try to parse the id into a number, if it fails, inform the user that the id was invalid
  try {
    id = parseInt(req.params.id);
  } catch (err) {
    console.log(err);
    res.status(401).json({ message: "Invalid id. All ids must be integers." });
    return;
  }

  // Once the id is parsed, retrieve the corresponding challenge from the database
  // If no challenges have a matching id, return a 404 error and return to stop execution.

  let challenge;
  try {
    challenge = await prisma.challenges.findUnique({ where: { id: id } });
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
    return;
  }

  if (challenge === null) {
    res.status(404).json({ message: `No challenge with id=${id} was found.` });
    return;
  }

  // Use the next function to continue to the next matching route handler
  next();
});

// Endpoints are defined here
// Get the daily challenge
challenges.get("/", async (req, res) => {
  try {
    // Find the challenge in the database with the date that matches today's date.
    const challenge = await prisma.challenges.findUnique({
      where: {
        date: new Date().toISOString().slice(0, 10),
      },
    });

    // If there is no challenge with the correct date, send a 404 error
    if (challenge === null) {
      res.status(404).json({
        message: "Not Found: No challenge has been created for today.",
      });
      return;
    }

    // Send challenge as response
    res.json(challenge);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default challenges;
