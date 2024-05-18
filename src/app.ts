// app.ts - Creates the express app and defines routes.

// Import dependencies
import express, { Request } from 'express';
import morgan from 'morgan';
import cors from 'cors';
import { kindeConfig, inDev, morganConfig } from './Config';

// Import the routers for the app
import users from './api/users';
import challenges from './api/challenges';
import completions from './api/completions';

const app = express();

app.use(express.json());
app.use(express.static('public'));
app.use(cors<Request>());

app.use(morgan(morganConfig.loggingLevel));

if (!inDev) {
  const { setupKinde } = require('@kinde-oss/kinde-node-express');

  setupKinde(kindeConfig, app);
}

//I am not sure if this is suppossed to be res or req
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization'
  );
  res.setHeader(
    'Access-Control-Allow-Methods',
    'GET, POST, PUT, DELETE, PATCH, OPTIONS'
  );
  next();
});

app.get('/api/', (req, res) => {
  console.log('in /api');
  res.json({ message: 'Welcome to the API' });
});

app.use('/api/v1/users', users);

app.use('/api/v1/challenges', challenges);

app.use('/api/v1/completions', completions);

export default app;
