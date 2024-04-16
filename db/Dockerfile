FROM postgres:16-alpine as base
EXPOSE 5432
# ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

FROM base as prod
COPY ./prod ./docker-entrypoint-initdb.d
CMD [ "postgres" ]


FROM base as dev
COPY ./dev ./docker-entrypoint-initdb.d
CMD [ "postgres" ]