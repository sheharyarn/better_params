defmodule BetterParams.Mixfile do
  use Mix.Project

  @app     :better_params
  @name    "BetterParams"
  @version "0.5.0"
  @github  "https://github.com/sheharyarn/#{@app}"


  # NOTE:
  # To publish package or update docs, use the `docs`
  # mix environment to not include support modules
  # that are normally included in the `dev` environment
  #
  #   MIX_ENV=docs hex.publish
  #


  def project do
    [
      # Project
      app:          @app,
      version:      @version,
      elixir:       "~> 1.3",
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
      {:plug,     ">= 1.0.0"              },
      {:ex_doc,   ">= 0.0.0", only: :docs },
      {:inch_ex,  ">= 0.0.0", only: :docs },
    ]
  end


  defp description do
    "Cleaner Plug params for Elixir web applications 🙌"
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
