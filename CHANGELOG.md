# Changelog

## [2.1.2](https://github.com/catppuccin/tmux/compare/v2.1.1...v2.1.2) (2024-12-08)


### Fixed

* improve uptime status sed script to report correct units for few uptime scenarios ([#437](https://github.com/catppuccin/tmux/issues/437)) ([31fc2bf](https://github.com/catppuccin/tmux/commit/31fc2bfb1123681dc06da613b944b85f81e4babd))
* use current window separators for the current window format ([#443](https://github.com/catppuccin/tmux/issues/443)) ([2a6c45b](https://github.com/catppuccin/tmux/commit/2a6c45b7c0da1594de1105d6cef15e3e68981113))

## [2.1.1](https://github.com/catppuccin/tmux/compare/v2.1.0...v2.1.1) (2024-11-17)


### Fixed

* escape the TPM environment variable in the kube status line module ([#434](https://github.com/catppuccin/tmux/issues/434)) ([eb78ade](https://github.com/catppuccin/tmux/commit/eb78ade9dc1f6cd8ba654572f51ddcae3c6e7fd7))
* specify the color for right separator of the status modules to be the same as text bg color ([#429](https://github.com/catppuccin/tmux/issues/429)) ([0e66dee](https://github.com/catppuccin/tmux/commit/0e66dee11ee396824668d4db863f1873e9e9243f))


### Documentation

* add possible values for window_flags ([#417](https://github.com/catppuccin/tmux/issues/417)) ([c8a2d1a](https://github.com/catppuccin/tmux/commit/c8a2d1ae9649aa904960bef1516ea2ff9a3e6ad0))
* **custom-status:** fix typo `catpuccin` -&gt; `catppuccin` ([#424](https://github.com/catppuccin/tmux/issues/424)) ([aaf9120](https://github.com/catppuccin/tmux/commit/aaf9120f769a34e5491b3ee7f885c8c347f2f663))

## [2.1.0](https://github.com/catppuccin/tmux/compare/v2.0.0...v2.1.0) (2024-10-25)


### Added

* add an option to format the window number with `[@catppuccin](https://github.com/catppuccin)_window_number` and `[@catppuccin](https://github.com/catppuccin)_window_current_number` ([c749885](https://github.com/catppuccin/tmux/commit/c74988511a462bdf07c5fc9ce88157b93a4ed185))


### Fixed

* allow for dynamic colors in status modules ([#411](https://github.com/catppuccin/tmux/issues/411)), fixes issue [#407](https://github.com/catppuccin/tmux/issues/407) ([5e273e4](https://github.com/catppuccin/tmux/commit/5e273e41dd3188a1a0e795b120623c95de491445))
* session status icon bg color change by client_prefix ([#394](https://github.com/catppuccin/tmux/issues/394)) ([8855667](https://github.com/catppuccin/tmux/commit/885566714315915547516de5c2f1b660f8e524c2))


### Documentation

* **README:** add [@kjnsn](https://github.com/kjnsn) to "Thanks to" section ([#398](https://github.com/catppuccin/tmux/issues/398)) ([c3fab98](https://github.com/catppuccin/tmux/commit/c3fab98ab4248a2a78c8193ad48f0991b7bfa1e3))

## [2.0.0](https://github.com/catppuccin/tmux/compare/v1.0.3...v2.0.0) (2024-10-21)


### ⚠ BREAKING CHANGES

* rebalance the colors used, and follow the styleguide
* change how windows are styled
* change how status modules are styled
* rebalance colors, adhere to style guide & overhaul docs ([#372](https://github.com/catppuccin/tmux/issues/372))

### Features

* change how status modules are styled ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))
* rebalance colors, adhere to style guide & overhaul docs ([#372](https://github.com/catppuccin/tmux/issues/372)) ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))
* rebalance the colors used, and follow the styleguide ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))
* rebalance the status module colors for cpu and battery ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))
* replace `_ctp_status_bg` with unified `_ctp_module_bg_color` in module configuration ([a4d4ad0](https://github.com/catppuccin/tmux/commit/a4d4ad09cc8b5c9338cbd4510450d0ae997a7710))


### Bug Fixes

* **tests:** add tests for window styling ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))
* use ubuntu-24.04 in ci ([#388](https://github.com/catppuccin/tmux/issues/388)) ([3b0e0a6](https://github.com/catppuccin/tmux/commit/3b0e0a6f0741bf09149f23620516decd7b5f5ba5))


### Code Refactoring

* change how windows are styled ([79284da](https://github.com/catppuccin/tmux/commit/79284da665bf5d39d304e23df4165c8ac37f9b7a))

## [1.0.3](https://github.com/catppuccin/tmux/compare/v1.0.2...v1.0.3) (2024-10-16)


### Bug Fixes

* change the default status line background to mantle ([#377](https://github.com/catppuccin/tmux/issues/377)) ([47dbe81](https://github.com/catppuccin/tmux/commit/47dbe818e3ad7a008ccbd3e5d69a29a4509f7d07))

## [1.0.2](https://github.com/catppuccin/tmux/compare/v1.0.1...v1.0.2) (2024-10-12)


### Bug Fixes

* **ci:** update tmux in test workflow ([#370](https://github.com/catppuccin/tmux/issues/370)) ([02debd3](https://github.com/catppuccin/tmux/commit/02debd396802af9fe4b41601739e48ef38217533))
* **status:** use a literal string for battery_icon so it can be replaced by the battery plugin ([#365](https://github.com/catppuccin/tmux/issues/365)) ([06fff2f](https://github.com/catppuccin/tmux/commit/06fff2f40ec4a5cd2c9e064bc7fde22130ecd4bb)), closes [#342](https://github.com/catppuccin/tmux/issues/342)
* typo in readme config example ([#362](https://github.com/catppuccin/tmux/issues/362)) ([41ee0b8](https://github.com/catppuccin/tmux/commit/41ee0b89acb3f4afe531209558d6b8e4d7d4ae1a))
* **window:** middle separator colors ([#369](https://github.com/catppuccin/tmux/issues/369)) ([c59df83](https://github.com/catppuccin/tmux/commit/c59df83d68e64feb8d015c2eb3f8b90febc95a53))

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
