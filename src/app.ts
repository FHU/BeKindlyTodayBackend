// app.ts - Creates the express app and defines routes.

import express from "express";

// Import the users router
import users from "./api/users";

// Create the app
const app = express();

// Use express json middleware for all routes
app.use(express.json());

// Use the users router in the corresponding route.
app.use("/api/v1/users/", users);

app.get("/", (req, res) => {
  res.json({ message: "Hello World!" });
});

// Export the app for the server to run.
export default app;
