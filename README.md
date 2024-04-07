# BeKindlyTodayBackend

An API to support the BeKindly.Today kindness challenge app.

## Developers

### Getting set up

Run `npm install`\
Run `npx prisma generate`

### Environment Variables

Development environment variables should be stored in a file in the root directory named `.env.dev`.\
This file will not be tracked by git and is unique to your local directory.\

#### Environment Variables

- DATABASE_URL
  - <span style="color:yellow;">**Required**</span>
  - Contains the url of the postgres docker container
- Port
  - Optional for development
  - Lists the port that the server will run on
- POSTGRES_PASSWORD
  - <span style="color:yellow;">**Required**</span>
  - Contains the password used for the postgres database

### Starting the server

- Start the docker container
  - Open a terminal in the root directory ([CTL] + `)
  - Run `npm run spin-db`
  - The postgres docker should now be running
- Start the server
  - Open a new terminal in the root directory ([CTL] + [SHIFT] + `)
  - Run `npm run dev`
  - The server should now be running on http://localhost:3000
