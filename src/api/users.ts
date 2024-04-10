// users.ts - The router for the users model in our API

// Import dependencies
import express from "express";
import { PrismaClient } from "@prisma/client";

// Create the router
const users = express.Router();

const prisma = new PrismaClient();

// Routes go here (get, post, put, delete)

users.get("/", async (req, res) => {
  try {
    const users = await prisma.user.findMany();

    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Export the router for use in the app.
export default users;
