import Config

config :identity,
  ecto_repos: [Identity.Repo]

config :identity, Identity.Repo,
  database: "identity",
  username: "abiwinanda",
  password: "",
  hostname: "localhost"
