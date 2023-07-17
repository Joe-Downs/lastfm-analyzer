#!/bin/bash

# Abort on error and unset variables
set -euo pipefail

database_name="lastfm_analyzer"

# For now, the user needs to manually start postgres and create the database

echo "Creating the tables in $database_name..."
psql --file=./create-tables.sql $database_name
