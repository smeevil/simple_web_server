defmodule SWS.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sws,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {SWS, []}
    ]
  end

  defp deps do
    [
      {:cowboy, tag: "2.0.0-pre.3", git: "https://github.com/ninenines/cowboy"}
    ]
  end
end
