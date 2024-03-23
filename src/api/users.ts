// users.ts - The router for the users model in our API

// Import express
import express from "express";

// Create the router
const users = express.Router();

// Routes go here (get, post, put, delete)

users.get("/", (req, res) => {
  res.json({ message: "Users!" });
});

// Export the router for use in the app.
export default users;
