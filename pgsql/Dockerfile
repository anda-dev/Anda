FROM postgres:latest
#ENV POSTGRES_DB project_database
COPY init.sql /docker-entrypoint-initdb.d/
RUN chmod a+r /docker-entrypoint-initdb.d/*
