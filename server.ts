// server.ts - Imports the app and sets it to listen on the indicated port.

import app from "./src/app";

const PORT = process.env.PORT;

const server = app.listen(PORT, () => {
  const HOST = process.env.HOSTNAME || "localhost";
  console.log(`Listening on ${HOST}:${PORT}`);
});

// Export server for testing
export default server;
