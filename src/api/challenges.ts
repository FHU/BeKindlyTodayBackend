// challenges.ts - Router for the challenges model

// import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

const challenges = express.Router();

const prisma = new PrismaClient();

// Example middleware to filter out 404 errors early
challenges.use("/:id", async (req, res, next) => {
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
    challenge = prisma.challenges.findUnique({ where: { id: id } });
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
