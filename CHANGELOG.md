Changelog
=========



[v1.0.0]
--------

- [Update] Deprecated `symbolize_merge/2`. Implementation renamed to `atomize_merge/2` instead.
- [Fix] Fix Plug warnings on newer Elixir versions.
- [Chore] Add CI and update Elixir/OTP and project dependencies.
- [Chore] Update project config, formatting and docs.



[v0.5.0]
--------

- [New] Add new `drop_string_keys` option to drop original string key params entirely.



[v0.4.0]
--------

### Fixed

- [Fix] Preserve structs while converting nested params.



[v0.3.0]
--------

- [New] Add support for nested maps inside lists.
- [Fix] Preserve non-map values while processing nested lists.



[v0.2.0]
--------

- [Change] Switch to `String.to_existing_atom/1` to protect against VM DOS attacks.



[v0.1.0]
--------

- First release of BetterParams.



[Unreleased]: https://github.com/sheharyarn/better_params/compare/v1.0.0...HEAD
[v1.0.0]: https://github.com/sheharyarn/better_params/compare/v0.5.0...v1.0.0
[v0.5.0]: https://github.com/sheharyarn/better_params/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/sheharyarn/better_params/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/sheharyarn/better_params/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/sheharyarn/better_params/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/sheharyarn/better_params/releases/tag/v0.1.0
