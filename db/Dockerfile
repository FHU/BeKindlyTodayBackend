FROM postgres:16-alpine as base
EXPOSE 5432
# ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

COPY ./dev ./docker-entrypoint-initdb.d
CMD [ "postgres" ]