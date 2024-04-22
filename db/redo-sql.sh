#!/bin/bash

#You need pg_dump installed locally to run this script.

POSTGRES_PASSWORD=Mydatabasepassword1
POSTGRES_USER=bktdbsudouser
DATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER}


echo "Generating .env..."
echo "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}\nPOSTGRES_USER=${POSTGRES_USER}\nDATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER}" > ./.env

docker run -dp 5432:5432 -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e POSTGRES_USER=${POSTGRES_USER} --name bkt_db_c postgres:16-alpine 

#This sleep is to make sure the postgres db is up all the way before running commands against it. I looked at ways to check to make sure
#it was running using things like healthchecks, curl, nc, etc but I find this solution to be the simplest since it will never take more
#than 5ish seconds to run a brand new postgres instance
sleep 5

npx prisma migrate deploy

echo "Inserting Challenges"
psql --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER} -f ./db/sql/challenges_upsert.sql

echo "Dumping Production Seed"
pg_dump --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER} > ./db/prod/seed.sql

docker stop bkt_db_c
docker rm bkt_db_c


#Recreate Dev Data
POSTGRES_USER=postgres
DATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER}

echo "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}\nPOSTGRES_USER=${POSTGRES_USER}\nDATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER}" > ./.env

docker run -dp 5432:5432 -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e POSTGRES_USER=${POSTGRES_USER} --name bkt_db_c postgres:16-alpine 

sleep 5

npx prisma migrate deploy

echo "Inserting Challenges"
psql --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER} -f ./db/sql/challenges_upsert.sql

#New dummy data might be needed when a schema change is made
echo "Inserting dummy data"
psql --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER} -f ./db/sql/dummydata.sql

echo "Dumping Dev seed"
pg_dump --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_USER} > ./db/dev/dev_data.sql

docker stop bkt_db_c
docker rm bkt_db_c
