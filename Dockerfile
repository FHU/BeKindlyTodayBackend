FROM node:21-alpine as base

WORKDIR /api
COPY package*.json ./
ENV PORT=${PORT}
EXPOSE ${PORT}


FROM base as prod

ENV DATABASE_URL=${DATABASE_URL}

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

WORKDIR /api
RUN npm i
COPY . .
RUN npx prisma generate
CMD [ "npm", "run", "dev" ]
