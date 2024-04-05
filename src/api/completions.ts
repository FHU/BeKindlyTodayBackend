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
    const challenge = await prisma.challenges.findUnique({
      where: {
        date: new Date().toISOString().slice(0, 10),
      },
    });

    // FIXME Schema does not easily support enforcing uniqueness completions based on user + challenge
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default completions;
