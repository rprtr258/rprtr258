boilerplate to copy and use:
```makefile
.PHONY: help
help: # show list of all commands
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: run
run: # run app
	go run main.go

.PHONY: test
test: TEST_DIR?=...
test: # run unit tests
	go test ./$(TEST_DIR) -count=1

.PHONY: lint
lint: # run linter
	golangci-lint run --exclude-use-default=false --disable-all \
		--enable=revive --enable=deadcode --enable=errcheck --enable=govet --enable=ineffassign --enable=structcheck --enable=typecheck --enable=varcheck --enable=asciicheck --enable=bidichk --enable=bodyclose --enable=containedctx --enable=contextcheck --enable=cyclop --enable=decorder --enable=depguard --enable=dogsled --enable=dupl --enable=durationcheck --enable=errchkjson --enable=errname --enable=errorlint --enable=execinquery --enable=exhaustive --enable=exhaustruct --enable=exportloopref --enable=forbidigo --enable=forcetypeassert --enable=funlen --enable=gochecknoglobals --enable=gochecknoinits --enable=gocognit --enable=goconst --enable=gocritic --enable=gocyclo --enable=godot --enable=godox --enable=goerr113 --enable=gofmt --enable=gofumpt --enable=goimports --enable=gomnd \
		--enable=gomoddirectives --enable=gomodguard --enable=goprintffuncname --enable=gosec --enable=grouper --enable=ifshort --enable=importas --enable=lll --enable=maintidx --enable=makezero --enable=misspell --enable=nestif --enable=nilerr --enable=nilnil --enable=noctx --enable=nolintlint --enable=nosprintfhostport --enable=paralleltest --enable=prealloc --enable=predeclared --enable=promlinter --enable=rowserrcheck --enable=sqlclosecheck --enable=tenv --enable=testpackage --enable=thelper --enable=tparallel --enable=unconvert --enable=unparam --enable=wastedassign --enable=whitespace --enable=wrapcheck

.PHONY: precommit
precommit: # run precommit checks
	$(MAKE) lint
	$(MAKE) test

.PHONY: todo
todo: # show list of all todos left in code
	@rg 'TODO' --glob '**/*' || echo 'All done!'
```

- every rule that does not compiles/downloads files must be prefixed by `.PHONY: rule`
- every command should have docstring like so:
```makefile
rule: # this does something
```
- every `make` subcall must be called using `$(MAKE)`
- reserved rule names:
  - `help` rule must be first, in order to show it on `make` command, shows list of command with description
  - `run` run main executable with default parameters: envs, local database params and etc.
  - `lint` run linter to check code quality automatically
  - `test` run all tests that do not need any additional actions
  - `precommit` usually just runs `$(MAKE) lint`, then `$(MAKE) test`
  - `todo` show list of `// TODO: something` like comments
  - `build` build executable
- vars definitions are put into beginning of the file or rule-specific
  - `VAR:=VALUE` set value once
  - `VAR?=VALUE` vars that can be changed through env vars or `make rule VAR=ANOTHER_VALUE` command
  - `VAR=VALUE` vars are evaluated on usage, use for shell commands that might need to be rerunned
- dotenv files are included like so:
```makefile
include .env
export
```
- particular cases (e.g. `run`ning different targets) commands for different purposes are named as `$(PARENT)-$(COMAND)`, e.g.
```makefile
run-reposts:
	go run main.go reposts -u https://vk.com/wall168715495_1312
run-dumpwall:
	go run main.go dumpwall -u https://vk.com/rprtr258
run-count:
	go run main.go count --friends 168715495 --groups -187839235
```
- echo calls must be prefixed with `@`, e.g.
```makefile
@echo 'something important is happening now...'
```
- frequently used commands should be aliased, e.g.
```makefile
DOCKER_COMPOSE:=docker compose -f .deploy/docker-compose.yml
VKUTILS:=go run main.go --token $(shell cat .env)
```
