FROM node:21-alpine as base

WORKDIR /api
COPY package*.json ./

#This wont put these env vars into the builds, but creates a way for people to know what each container needs
ENV PORT=${PORT}
EXPOSE ${PORT}
# ENV DATABASE_URL=${DATABASE_URL}

FROM base as prod

ENV NODE_ENV=production
RUN addgroup api && adduser -S -G api api

USER api
WORKDIR /api

USER root
RUN chown -R api:api .

USER api

RUN npm install

COPY . .

RUN npx prisma generate

CMD [ "npm", "run", "prod" ]

FROM base as dev
ENV NODE_ENV=development
RUN npm install
COPY . .
RUN npx prisma generate
CMD [ "npm", "run", "dev" ]
