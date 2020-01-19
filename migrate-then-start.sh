#!/bin/sh
# wait-for-postgres.sh from https://docs.docker.com/compose/startup-order/

set -e

>&2 echo "migrate-then-start.sh running"

until PGPASSWORD=$DB_PWD psql -h "$DB_HOST" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

./bin/portishead eval "Portishead.Release.migrations"
>&2 echo "start migrate"
./bin/portishead eval "Portishead.Release.migrate"
>&2 echo "end migrate"
./bin/portishead eval "Portishead.Release.migrations"
./bin/portishead start
