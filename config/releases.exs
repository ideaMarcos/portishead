import Config

config :portishead, PortisheadWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.fetch_env!("PORT"))],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  server: true

config :portishead, Portishead.Repo,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  username: System.fetch_env!("DB_USER"),
  password: System.fetch_env!("DB_PASSWORD"),
  database: "portishead",
  hostname: System.fetch_env!("DB_HOST")
