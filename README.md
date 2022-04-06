# Builds a self contained Postgresql Database

This project provides a Dockerfile that would build a Docker Postgres image with data preloaded.

The build process is a multi-stage build takes a provided `latest.sql` dump file, loads it into a Postgres database image
and then copies the created $PGDATA folder into a new Postgres database image such that when the image is started,
it starts with the database already populated.


