SHELL   := /bin/bash
DIR_BIN ?= "$$HOME/bin"

syntax-check:
	set -eo pipefail;file --mime-type * | grep shellscript | tr -d ':' | while read F _;do shellcheck $$F;done

install:
	[[ -d "$(DIR_BIN)" ]] || mkdir -p "$(DIR_BIN)"
	set -eo pipefail;file --mime-type * | grep shellscript | tr -d ':' | while read F _;do install -m 0755 -v $$F $(DIR_BIN)/$SF;done
