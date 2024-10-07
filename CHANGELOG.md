# Changelog

## [1.0.1](https://github.com/catppuccin/tmux/compare/v1.0.0...v1.0.1) (2024-10-05)


### Bug Fixes

* **readme:** fix the example configurations ([#343](https://github.com/catppuccin/tmux/issues/343)) ([06183b3](https://github.com/catppuccin/tmux/commit/06183b31216b4ed917760b3d59565e242eee6a64))
* **readme:** fix the version number, and fix escaping in the custom status line module docs ([#357](https://github.com/catppuccin/tmux/issues/357)) ([db466f8](https://github.com/catppuccin/tmux/commit/db466f8c2dbcfdd84e501ee8274bdfdcf049d65d))

## [1.0.0](https://github.com/catppuccin/tmux/compare/v0.4.0...v1.0.0) (2024-10-02)


### Bug Fixes

* **readme:** remove -F when setting the status line ([#333](https://github.com/catppuccin/tmux/issues/333)) ([b38421f](https://github.com/catppuccin/tmux/commit/b38421fa15d8dfafecaf6f438115cfe3c1259bf0))

## [0.4.0](https://github.com/catppuccin/tmux/compare/v0.3.0...v0.4.0) (2024-10-01)


### ⚠ BREAKING CHANGES

* rewrite to use tmux native rather than bash ([#328](https://github.com/catppuccin/tmux/issues/328))

### Bug Fixes

* **readme:** update the readme to include upgrade instructions ([1bcad05](https://github.com/catppuccin/tmux/commit/1bcad05f206fb4bb9706403da24b97d2cdb64bad))
* **window:** ensure the window formats are set correctly ([#331](https://github.com/catppuccin/tmux/issues/331)) ([1bcad05](https://github.com/catppuccin/tmux/commit/1bcad05f206fb4bb9706403da24b97d2cdb64bad))


### Code Refactoring

* rewrite to use tmux native rather than bash ([#328](https://github.com/catppuccin/tmux/issues/328)) ([87fa4a0](https://github.com/catppuccin/tmux/commit/87fa4a08c5a7fdbef3130f05a8b12f0ca26d4a46))

## [0.3.0](https://github.com/catppuccin/tmux/compare/v0.2.0...v0.3.0) (2024-09-17)


### Features

* **status:** Add support for status module middle separators ([#310](https://github.com/catppuccin/tmux/issues/310)) ([1612a23](https://github.com/catppuccin/tmux/commit/1612a23174a6771ac466312eb156f83b8b89d907))
* **status:** window specific separator config ([#198](https://github.com/catppuccin/tmux/issues/198)) ([8276c5a](https://github.com/catppuccin/tmux/commit/8276c5a5e33dbbbae3d370db2f6129e20b402f8a))


### Bug Fixes

* **kube:** escape env var ([c31b9b2](https://github.com/catppuccin/tmux/commit/c31b9b2c6c7c50abbebd02b80c4fd32b2782a011))

## [0.2.0](https://github.com/catppuccin/tmux/compare/v0.1.0...v0.2.0) (2024-08-23)


### Features

* error/warning messages on first load ([#278](https://github.com/catppuccin/tmux/issues/278)) ([a2dda02](https://github.com/catppuccin/tmux/commit/a2dda02b43194aec5deddf2890c28c76b4c11ed4))
* warn users of whitespace in module lists ([#266](https://github.com/catppuccin/tmux/issues/266)) ([362a306](https://github.com/catppuccin/tmux/commit/362a306db71794f04d0995fc058bcaa094d1af70))


### Bug Fixes

* add missing batch options `catppuccin_pane{,_active}_border_style` ([3ffbc37](https://github.com/catppuccin/tmux/commit/3ffbc3700b4c1c3e2c4d015c5a51ccef555dabaf))
* add missing batch options catppuccin_pane{,_active}_border_style ([3ffbc37](https://github.com/catppuccin/tmux/commit/3ffbc3700b4c1c3e2c4d015c5a51ccef555dabaf))
* escaping in options ([#298](https://github.com/catppuccin/tmux/issues/298)) ([9b57c20](https://github.com/catppuccin/tmux/commit/9b57c2002081fff8af16b878f1369d46788c0409))
* **pomodoro_plus:** option names ([#273](https://github.com/catppuccin/tmux/issues/273)) ([51dde6e](https://github.com/catppuccin/tmux/commit/51dde6e8d4d3d8da97d915b01594a08aa4ac0cca))
* warning `[@catppuccin](https://github.com/catppuccin)_flavour` ([#296](https://github.com/catppuccin/tmux/issues/296)) ([a71f3c0](https://github.com/catppuccin/tmux/commit/a71f3c039bed8a7c49fc390a50befec5db2c4af9))
* warning `[@catppuccin](https://github.com/catppuccin)_window_status` ([9ee1695](https://github.com/catppuccin/tmux/commit/9ee1695d757c16e2f236858b8d3f88be9fb666fa))


### Performance Improvements

* batch tmux show ([#288](https://github.com/catppuccin/tmux/issues/288)) ([99013fa](https://github.com/catppuccin/tmux/commit/99013fafe6a98416079b3b84751f2eb540e17c79)), closes [#281](https://github.com/catppuccin/tmux/issues/281)
* batch tmux show-options ([3c6f6f2](https://github.com/catppuccin/tmux/commit/3c6f6f282b3bb17554dc2b4b80760b6507acfd65))

## [0.1.0](https://github.com/catppuccin/tmux/compare/v0.0.1...v0.1.0) (2024-08-04)


### Features

* releases ([#260](https://github.com/catppuccin/tmux/issues/260)) ([5fbacdf](https://github.com/catppuccin/tmux/commit/5fbacdf3559cf4496eef02aead087b3bb715e570))
