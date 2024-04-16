// app.ts - Creates the express app and defines routes.

// Import dependencies
import express from 'express';
import morgan from 'morgan';

// Import the routers for the app
import users from './api/users';
import challenges from './api/challenges';
import completions from './api/completions';

// Create the app
const app = express();

// Use express json middleware for all routes
app.use(express.json());

// Set debug based on environment variables
const DEBUG = process.env.DEBUG?.toLowerCase() === 'true' || false;

// Set logging level based on debug mode and add morgan middleware to app
const logging_level = DEBUG ? 'dev' : 'tiny';
app.use(morgan(logging_level));

// Use the users router in the corresponding route.
app.use('/api/v1/users', users);

app.use('/api/v1/challenges', challenges);

app.use('/api/v1/completions', completions);

// Export the app for the server to run.
export default app;
