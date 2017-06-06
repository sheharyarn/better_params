[BetterParams][docs]
====================

[![Build Status][shield-travis]][travis-ci]
[![Coverage Status][shield-inch]][docs]
[![Version][shield-version]][hexpm]
[![License][shield-license]][hexpm]

> Cleaner request parameters in Elixir web applications

`BetterParams` is a simple Elixir [Plug][plug] that allows passed
request parameters to be called as `atoms` instead of Strings. The
sole purpose of this Plug is to pattern match on maps with atom keys
instead of string keys in routers/controllers to calm my OCD down.

<br>




## Installation

Add `better_params` to your project dependencies in `mix.exs`:

```elixir
def deps do
  [{:better_params, "~> 0.1.0"}]
end
```

<br>




## Contributing

 - [Fork][github-fork], Enhance, Send PR
 - Lock issues with any bugs or feature requests
 - Implement something from Roadmap
 - Spread the word :heart:

<br>




## License

This package is available as open source under the terms of the [MIT License][license].

<br>




  [shield-version]:   https://img.shields.io/hexpm/v/better_params.svg
  [shield-license]:   https://img.shields.io/hexpm/l/better_params.svg
  [shield-downloads]: https://img.shields.io/hexpm/dt/better_params.svg
  [shield-travis]:    https://img.shields.io/travis/sheharyarn/better_params/master.svg
  [shield-inch]:      https://inch-ci.org/github/sheharyarn/better_params.svg?branch=master

  [travis-ci]:        https://travis-ci.org/sheharyarn/better_params
  [inch-ci]:          https://inch-ci.org/github/sheharyarn/better_params

  [license]:          https://opensource.org/licenses/MIT
  [hexpm]:            https://hex.pm/packages/better_params
  [plug]:             https://github.com/elixir-lang/plug

  [docs]:             https://hexdocs.pm/better_params

  [github-fork]:      https://github.com/sheharyarn/better_params/fork


