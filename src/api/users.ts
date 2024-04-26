// users.ts - The router for the users model in our API

// Import dependencies
import express, { Response } from "express";
import { PrismaClient } from "@prisma/client";
import { jwtVerify } from "@kinde-oss/kinde-node-express";
import getUser from "../services/UserServices";

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: "", //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create the router
const users = express.Router();

const prisma = new PrismaClient();

// Routes go here (get, post, put, delete)

users.get("/", verifier, async (req, res) => {
  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    user.kindeId = "classified";
    res.json(user);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

users.get("/:id", verifier, async (req, res) => {
  const id = parseInt(req.params.id);

  if (isNaN(id)) {
    return res
      .status(400)
      .json({ message: "Bad request, ids must be integers" });
  }

  try {
    const user = await prisma.user.findFirst({ where: { id } });

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    user.kindeId = "classified";
    res.json(user);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal server error" });
  }
});

users.put("/bio", verifier, async (req, res) => {
  const bio = req.body.bio;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        bio,
      },
    });

    modifiedUser.kindeId = "classified";
    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

users.put("/profilepicture", verifier, async (req, res) => {
  const profilePicture = req.body.profilePicture;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        profilePicture: profilePicture,
      },
    });

    modifiedUser.kindeId = "classified";
    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

users.put("/username", verifier, async (req, res) => {
  const username = req.body.username;

  try {
    const user = await getUser(req);

    if (user === null) {
      return res.status(404).json({ message: "User not found" });
    }

    const modifiedUser = await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        username,
      },
    });

    modifiedUser.kindeId = "classified";
    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Export the router for use in the app.
export default users;
