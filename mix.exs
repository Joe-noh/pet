defmodule Pet.Mixfile do
  use Mix.Project

  def project do
    [app: :pet,
     version: "0.1.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:yomel, "~> 0.2"}]
  end
end
