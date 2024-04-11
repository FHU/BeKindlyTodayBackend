#!/bin/bash

#You need pg_dump installed locally to run this script.

docker run -dp 5432:5432 -e POSTGRES_PASSWORD=Mydatabasepassword1 --name bkt_db_c postgres:16-alpine 

#This sleep is to make sure the postgres db is up all the way before running commands against it. I looked at ways to check to make sure
#it was running using things like healthchecks, curl, nc, etc but I find this solution to be the simplest since it will never take more
#than 5ish seconds to run a brand new postgres instance
sleep 5

dotenv -e .env.dev -- npx prisma migrate deploy

echo "Dumping Schema"
pg_dump --dbname=postgresql://postgres:Mydatabasepassword1@localhost:5432/postgres > ./db/prod/schema.sql

#New dummy data might be needed when a schema change is made
echo "Inserting dummy data"
psql --dbname=postgresql://postgres:Mydatabasepassword1@localhost:5432/postgres -f ./db/dummydata.sql

echo "Backing up database"
pg_dump --dbname=postgresql://postgres:Mydatabasepassword1@localhost:5432/postgres > ./db/dev/dev_data.sql

docker stop bkt_db_c
docker rm bkt_db_c