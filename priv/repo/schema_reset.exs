alias Portishead.Repo

vals = Application.get_env(:portishead, Repo)

schema = vals[:migration_default_prefix]
migration_table = vals[:migration_source]

Repo.query!("DROP SCHEMA IF EXISTS #{schema} CASCADE")
Repo.query!("DROP TABLE IF EXISTS #{migration_table}")
