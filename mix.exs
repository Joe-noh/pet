defmodule Pet.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pet,
      version: "0.1.1",
      elixir: "~> 1.0",
      description: description,
      package: package,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      docs: docs
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:yomel, "~> 0.2"}]
  end

  defp description do
    "Account management tool compatible with pit"
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "LICENSE*"],
     contributors: ["Joe Honzawa"],
     licenses: ["MIT"],
     links: %{
       "GitHub" => "https://github.com/Joe-noh/pet"
     }]
  end

  defp docs do
    [readme: "README.md", main: "README"]
  end
end
