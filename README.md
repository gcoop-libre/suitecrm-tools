# `suitecrm-tools`

Useful tools for _SuiteCRM_

## Install

### Manual

Clone the repository:

```bash

  cd /opt
  git clone https://gitlab.com/gcoop-libre/suitecrm-tools

```

Add to `$HOME/.bashrc`:

```bash

if [[ -d "/opt/suitecrm-tools" ]]
then
  PATH="/opt/suitecrm-tools:$PATH"
  source /opt/suitecrm-tools/
fi

```

# `suitecrm-prune`

After testing on a test instance of _SuiteCRM_ `v8.5.1`, it is
necessary to prune the custom module tables _gcoop_ and to simplify and
automate the task, the _script_ `suitecrm-prune` is executed which
perform the following steps:

01. Obtain own module tables, filter by prefix (example: `%gcoop%`)

02. Get tables with suffix `_cstm` filtered by prefix defined in `01`

03. Get tables with suffix `_audit` filtered by prefix defined in `01`

04. Get the relationships between tables found in `01`, `02` and `03`

05. Get totals from each table before prune database.

06. Execute dump of records to be deleted (when `RUN_DUMP=1` is defined)

07. Prune records with logical deletion (`deleted=1`)

08. Prune records before a specified date (`BEFORE_DATE=2024-10-09`)

09. Prune records from `_audit` tables

10. Prune records from `_cstm` table

11. Prune orphaned records based on relationships found in `04`

12. Generate report and verify eliminated totals.

ES NECESARIO REALIZAR UN BACKUP PREVIO A LA EJECUCIÓN DE
`suitecrm-prune` YA QUE ES UNA HERRAMIENTA EN DESARROLLO Y PODRÍA
ELIMINAR MÁS REGISTROS DE LOS ESPERADOS!

It is possible to define a regular expression of tables to be deleted in
the `REGEX_TABLES_EXCLUDE` variable.

## SUMMARY PRUNE DATABASE `suitecrm` ON `localhost` AT 2024-08-09 13:24:30 PID 1778628

```

# cat .suitecrm-prune.cfg

DRY_RUN=0
TABLES_LIKE=%gcoop%
BEFORE_DATE=2024-08-09
DB_NAME=suitecrm
DB_PORT=3306
DB_HOST=localhost
DB_USER=suitecrm
DB_PASS=suitecrm
SHOW_LOG=0
REGEX_TABLES_EXCLUDE=^(config|contacts|fields_meta_data|gcoop_alertas|gcoop_alertas_estados|gcoop_detalles|gcoop_estados|gcoop_filiales|gcoop_impresoras|gcoop_ma_atm_cd|gcoop_ma_tas|gcoop_parametrias|gcoop_proveedores|gcoop_tipificaciones|gcoop_tipos|gcoop_transiciones|jjwg_Maps|relationships|securitygroups|securitygroups_records|securitygroups_users|user_preferences|users)$

# suitecrm-prune

BEFORE_DATE=2024-08-09
RUN_AUDIT=1
RUN_CSTM=1
RUN_DATE=1
RUN_DELETED=1
RUN_ORPHAN=1
TABLES_LIKE=%gcoop%
```

| table                             | BEFORE | DELETED | DATE | AUDIT | CSTM | ORPHAN | TOTAL | AFTER | CHECK |
|-----------------------------------|--------|---------|------|-------|------|--------|-------|-------|-------|
| aop_case_updates                  |    395 |       0 |  395 |     0 |    0 |      0 |   395 |     0 |    OK |
| cases                             |     20 |       0 |   20 |     0 |    0 |      0 |    20 |     0 |    OK |
| cases_gcoop_incidencias           |     14 |       0 |   14 |     0 |    0 |      0 |    14 |     0 |    OK |
| contacts                          |   6207 |       1 | 6207 |     0 |    0 |      0 |  6208 |  6207 |    EX |
| gcoop_alertas                     |     34 |       0 |   34 |     0 |    0 |      6 |    52 |    34 |    EX |
| gcoop_alertas_audit               |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_alertas_estados             |     12 |       0 |   12 |     0 |    0 |      0 |    12 |    12 |    EX |
| gcoop_alertas_estados_audit       |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_bitacoradellamadas          |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_bitacoradellamadas_audit    |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_circuitos                   |      7 |       0 |    7 |     0 |    0 |      0 |     7 |     0 |    OK |
| gcoop_detalles                    |    885 |       0 |  885 |     0 |    0 |      1 |   886 |   885 |    EX |
| gcoop_emails                      |     27 |       0 |   27 |     0 |    0 |      0 |    27 |     0 |    OK |
| gcoop_estados                     |      5 |       0 |    5 |     0 |    0 |      4 |     9 |     5 |    EX |
| gcoop_filiales                    |    503 |       0 |  503 |     0 |    0 |      0 |   503 |   503 |    EX |
| gcoop_filiales_audit              |     10 |       0 |   10 |     0 |    0 |      0 |    10 |     0 |    OK |
| gcoop_impresoras                  |   1894 |       1 | 1894 |     0 |    0 |      0 |  1895 |  1894 |    EX |
| gcoop_impresoras_audit            |    769 |       0 |  769 |     0 |    0 |      0 |   769 |     0 |    OK |
| gcoop_incidencias                 |    266 |       1 |  265 |     0 |    0 |      0 |   266 |     0 |    OK |
| gcoop_incidencias_audit           |    272 |       0 |  272 |     0 |    0 |      0 |   272 |     0 |    OK |
| gcoop_ma_atm_cd                   |   1551 |     173 | 1551 |     0 |    0 |      0 |  1724 |  1551 |    EX |
| gcoop_ma_atm_cd_audit             |   3861 |       0 | 3861 |     0 |    0 |      0 |  3861 |     0 |    OK |
| gcoop_ma_tas                      |    989 |      75 |  989 |     0 |    0 |      0 |  1064 |   989 |    EX |
| gcoop_ma_tas_audit                |   1336 |       0 | 1336 |     0 |    0 |      0 |  1336 |     0 |    OK |
| gcoop_noticias                    |     20 |       0 |   20 |     0 |    0 |      0 |    20 |     0 |    OK |
| gcoop_noticias_audit              |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_origenes_de_problemas       |      9 |       4 |    5 |     0 |    0 |      0 |     9 |     0 |    OK |
| gcoop_origenes_de_problemas_audit |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_parametrias                 |    190 |       0 |  190 |     0 |    0 |      0 |   190 |   190 |    EX |
| gcoop_parametrias_audit           |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_proveedores                 |      4 |       0 |    4 |     0 |    0 |      0 |     4 |     4 |    EX |
| gcoop_proveedores_audit           |      2 |       0 |    2 |     0 |    0 |      0 |     2 |     0 |    OK |
| gcoop_socios                      |     43 |       0 |   43 |     0 |    0 |      0 |    43 |     0 |    OK |
| gcoop_soluciones                  |      7 |       0 |    7 |     0 |    0 |      0 |     7 |     0 |    OK |
| gcoop_soluciones_audit            |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_tipificaciones              |    295 |       1 |  295 |     0 |    0 |      0 |   591 |   295 |    EX |
| gcoop_tipos                       |    321 |       0 |  321 |     0 |    0 |      0 |   321 |   321 |    EX |
| gcoop_transiciones                |     14 |       0 |   14 |     0 |    0 |      0 |    28 |    14 |    EX |
| gcoop_workstations                |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| gcoop_workstations_audit          |      0 |       0 |    0 |     0 |    0 |      0 |     0 |     0 |    EM |
| notes                             |     96 |       0 |   96 |     0 |    0 |      0 |    96 |     0 |    OK |
| securitygroups                    |     19 |       0 |   19 |     0 |    0 |      0 |    19 |    19 |    EX |
| users                             |    449 |       0 |  449 |     0 |    0 |      0 |   449 |   449 |    EX |

|  TABLES |   TOTAL |
|---------|---------|
|      OK |      17 |
|   EMPTY |      10 |
| EXCLUDE |      16 |
|   ERROR |       0 |
|   TOTAL |      43 |

## License

_GNU General Public License, GPLv3._

## Author Information

This repo was created in 2024 by
 [Osiris Alejandro Gomez](https://osiux.com/), worker cooperative of
 [gcoop Cooperativa de Software Libre](https://www.gcoop.coop/).
