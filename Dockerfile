FROM postgres:11.9-alpine AS load_data

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=Mobile
ENV PGDATA=/data
COPY ./latest.sql /docker-entrypoint-initdb.d/latest.sql
RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
RUN ["usr/local/bin/docker-entrypoint.sh", "postgres"]

FROM postgres:11.9-alpine
COPY --from=load_data /data $PGDATA
