#!/usr/bin/env bash

#== Install postgresql on the host.
echo 'PostgreSQL is not installed. Installing it now.'
time sudo apt-get update
time sudo apt-get install -y postgresql postgresql-17-pgvector
#== Make it less promiscuous in DDEV only.
if env | grep -q DDEV_PROJECT; then
  sudo chmod 0755 /usr/bin
  sudo chmod 0755 /usr/sbin
  #== Start the PostgreSQL service.
  env PATH="/usr/sbin:/usr/bin:/sbin:/bin" sudo service postgresql start
else
  #== Start the PostgreSQL service.
  sudo service postgresql start
fi
#== Create the user.
sudo su postgres -c "psql -c \"CREATE ROLE db WITH LOGIN PASSWORD 'db';\""
#== Create the database.
sudo su postgres -c "psql -c \"CREATE DATABASE db WITH OWNER db ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C' TEMPLATE template0;\""
#== Enable pgvector extension.
sudo su postgres -c "psql -d db -c \"CREATE EXTENSION IF NOT EXISTS vector;\""
