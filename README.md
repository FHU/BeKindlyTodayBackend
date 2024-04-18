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
- ENVIRONMENT
  - <span style="color:yellow;">**Required**</span>
  - Sets the enviroment to know whether to use authentication or not
- KINDE_BACKEND_CLIENT_ID
  - The ID of the client on Kinde
- KINDE_URL
  - The URL of the website on Kinde's subdomain
- SITE_URL
  - The URL of BeKindly
- KINDE_CLIENT_SECRET
  - The secret of the client on Kinde
- UNAUTHORIZED_URL
  - The URL that unauthorized users are redirected to when attempting access of a protected route

### Starting the server

- Start the docker container
  - Run `npm run dev:docker`
  - Connect to the backend at https://localhost:$PORT
