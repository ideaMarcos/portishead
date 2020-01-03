# Portishead

## Docker stuff

docker-compose up --build

docker-compose down

docker run --rm -it -p 4011:4011 -e PORT=4011 -e DB_USER=postgres -e DB_PWD=postgres -e DB_HOST=host.docker.internal -e SECRET_KEY_BASE=$(mix phx.gen.secret) portishead SOME_COMMAND
- eval "Portishead.Release.migrate"
- start

docker system prune -a -f

