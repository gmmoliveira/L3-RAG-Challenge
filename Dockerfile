FROM pgvector/pgvector:0.8.0-pg17-bookworm

# Install Python and pip
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

COPY ./recursos/ /app

# Set working directory for application
WORKDIR /app

# Set up database initialization script
RUN echo "CREATE EXTENSION IF NOT EXISTS vector;" > /docker-entrypoint-initdb.d/vector.sql

# Environment variables
ENV POSTGRES_USER=RAG_app
ENV POSTGRES_PASSWORD=my_passwd321
ENV POSTGRES_DB=RAG_DB
