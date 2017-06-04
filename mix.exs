defmodule BetterParams.Mixfile do
  use Mix.Project

  @app     :better_params
  @name    "BetterParams"
  @version "0.1.0"
  @github  "https://github.com/sheharyarn/#{@app}"


  def project do
    [
      # Project
      app:          @app,
      version:      @version,
      elixir:       "~> 1.2",
      description:  description(),
      package:      package(),
      deps:         deps(),

      # ExDoc
      name:         @name,
      source_url:   @github,
      homepage_url: @github,
      docs: [
        main:       @name,
        canonical:  "https://hexdocs.pm/#{@app}",
        extras:     ["README.md"]
      ]
    ]
  end


  def application do
    [applications: []]
  end


  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev },
    ]
  end


  defp description do
    "Cleaner Plug params for Elixir web applications"
  end


  defp package do
    [
      name: @app,
      maintainers: ["Sheharyar Naseer"],
      licenses: ["MIT"],
      files: ~w(mix.exs lib README.md),
      links: %{"Github" => @github}
    ]
  end
end
