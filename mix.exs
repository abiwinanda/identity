defmodule Identity.MixProject do
  use Mix.Project

  def project do
    [
      app: :identity,
      version: "0.0.1",
      elixir: "~> 1.9",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Identity",
      source_url: "https://github.com/abiwinanda/identity"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.3"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end

  defp description() do
    "Identity access management in elixir"
  end

  defp package() do
    [
      # These are the default files included in the package
      files: [
        "lib",
        "mix.exs",
        "README.md",
        ".formatter.exs"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/abiwinanda/identity"}
    ]
  end
end
