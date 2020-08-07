import Config

config :portishead, PortisheadWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.fetch_env!("PORT"))],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  server: true

config :portishead, Portishead.Repo,
  username: System.fetch_env!("DB_USER"),
  password: System.fetch_env!("DB_PASSWORD"),
  database: System.fetch_env!("DB_NAME"),
  hostname: System.fetch_env!("DB_HOST")
