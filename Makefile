#!/usr/bin/make -f
.PHONY: help
help:  ## This.
	@perl -ne 'print if /^[a-zA-Z_-]+:.*## .*$$/' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test:  ## Tests everything
	tests/yaml_syntax
	tests/json_syntax
	tests/jinja_syntax
	tests/test_edx_east_roles.sh
