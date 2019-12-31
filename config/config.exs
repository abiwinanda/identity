import Config

config :identity,
  ecto_repos: [Identity.Repo]

config :identity, Identity.Repo,
  database: "ecto_simple",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
