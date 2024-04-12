FROM node:21-alpine as base

WORKDIR /api
COPY package*.json ./
ENV PORT=${PORT}
EXPOSE ${PORT}
ENV DATABASE_URL=${DATABASE_URL}

FROM base as prod

RUN addgroup api && adduser -S -G api api

USER api
WORKDIR /api

USER root
RUN chown -R api:api .

USER api

RUN npm ci

COPY . .

RUN npx prisma generate

CMD [ "npm", "run", "prod" ]

FROM base as dev

RUN npm install
COPY . .
RUN npx prisma generate
CMD [ "npm", "run", "dev" ]
