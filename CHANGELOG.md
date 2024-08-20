# [_SUITECRM-TOOLS CHANGELOG_](https://gitlab.com/gcoop-libre/suitecrm-tools)

 - this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

## [`Unreleased - 2024-08-19`](https://gitlab.com/gcoop-libre/suitecrm-tools/-/compare/v0.3.0...develop)


## [`v0.3.0 - 2024-08-19`](https://gitlab.com/gcoop-libre/suitecrm-tools/-/compare/v0.2.0...v0.3.0) _add suitecrm-cfg2env to overwrite environment database credentials in NG (.env) with values from PHP (config_override.php)_

- suitecrm-cfg2env: overwrite environment database credentials in ENV with values from CFG

### `CHANGELOG`

- update Unreleased and add v0.2.0

### `README`

- add suitecrm-cfg2env section with execution example

### `suitecrm-cfg-chk`

- validate mimetype of CFG as text/x-php and ENV as text/plain
- improve params to allow full and relative path of CFG and ENV
- remove simple quote from DATABASE_URL in env_get_db_url function

## [`v0.2.0 - 2024-08-14`](https://gitlab.com/gcoop-libre/suitecrm-tools/-/compare/v0.1.1...v0.2.0) _add suitecrm-cfg-chk to compare environment configuration between PHP (config_override.php) and NG (.env)_


### `CHANGELOG`

- update Unreleased, add v0.1.0, v0.1.1,

### `README`

- add section suitecrm-cfg-chk and improve heading levels

### `suitecrm-cfg-chk`

- add script to compare environment configuration between PHP and NG

## [`v0.1.1 - 2024-08-10`](https://gitlab.com/gcoop-libre/suitecrm-tools/-/compare/v0.1.0...v0.1.1) _minor fix in README, translate WARNING PERFORM BACKUP PRIOR TO EXECUTE suitecrm-prune_


### `README`

- translate WARNING PERFORM BACKUP PRIOR TO EXECUTE suitecrm-prune

## [`v0.1.0 - 2024-08-10`](https://gitlab.com/gcoop-libre/suitecrm-tools/-/compare/569bed4...v0.1.0) _first public version to prune logically deleted records, before a date, from _audit and _cstm tables and orphaned records_


### `description`

- add Useful tools for SuiteCRM

### `general`

- add GPLv3 GNU GENERAL PUBLIC LICENSE

### `Makefile`

- add syntax-check and install rules

### `pre-commit`

- add check-executables-have-shebangs, end-of-file-fixer, shell-lint, trailing-whitespace hooks

### `README`

- date fix in suitecrm-prune example report
- add Install, License, Author Information and suitecrm-prune example

### `suitecrm-prune`

- add first public version to prune logically deleted records, before a date, from _audit and _cstm tables and orphaned records
