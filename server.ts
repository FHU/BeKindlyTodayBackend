// server.ts - Imports the app and sets it to listen on the indicated port.

// Import the app from src
import app from "./src/app";

// Read port from environment variables
const PORT = process.env.PORT;

// Read debugging mode from environment variables
const DEBUG = process.env.DEBUG === "true" || false;

// Have the app listen on the desired port
const server = app.listen(PORT, () => {
  const HOST = process.env.HOSTNAME ?? "localhost";
  console.log(`Listening on ${HOST}:${PORT}`);
  DEBUG ??
    console.log(
      "Running in debug mode. Set DEBUG to false in environment variables to disable debug mode.\nDisable debug mode for production!"
    );
});

// Export server for testing
export default server;
