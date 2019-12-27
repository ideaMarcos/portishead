# Portishead

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


# Docker

docker system prune -a -f

docker build --no-cache -t portishead .

docker run --rm -it -p 4011:4011 -e PORT=4011 -e DB_USER=postgres -e DB_PWD=postgres -e DB_HOST=host.docker.internal -e SECRET_KEY_BASE=$(mix phx.gen.secret) portishead SOME_COMMAND
- eval "Portishead.Release.migrate"
- start
