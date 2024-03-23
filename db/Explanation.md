# This is why I have done as I've done

To run prisma migrate, you need to have the container the prisma schema is in running.
So, we can't get an independent database image without running some sql in the image.

What I have done is run a migration, dumped the migration to get the table sql in a format that
the pg image devs request the sql be in, put the dummy data in the database, dumped that,
then wrote a dockerfile where, depending on the environment, the container will run the prod sql or dev sql.

## Please note

- It is important that we change the database password env var when we deploy. It is located in the dockerfile.

- This db assumes youre using the postgres user as the user in prod. IRL, we should add additional users for better security to the DB and Alpine.
