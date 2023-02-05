boilerplate to copy and use:
```makefile
@_help:
    just --list --unsorted

# check that executable is installed and accessible
@_tool-exists cmd:
    command -v {{cmd}} || echo '{{cmd}} is not installed'

# run app
@run:
    go run cmd/app/app.go

# run unit tests
@test:
    go test ./...

# run tests and open coverage in browser
@coverage:
    go test -v -coverprofile=cover.out -covermode=atomic .
    go tool cover -html=cover.out

# run linter
@lint:
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    golangci-lint run --exclude-use-default=false --disable-all \
        --enable=revive --enable=deadcode --enable=errcheck --enable=govet --enable=ineffassign --enable=structcheck --enable=typecheck --enable=varcheck --enable=asciicheck --enable=bidichk --enable=bodyclose --enable=containedctx --enable=contextcheck --enable=cyclop --enable=decorder --enable=depguard --enable=dogsled --enable=dupl --enable=durationcheck --enable=errchkjson --enable=errname --enable=errorlint --enable=execinquery --enable=exhaustive --enable=exhaustruct --enable=exportloopref --enable=forbidigo --enable=forcetypeassert --enable=funlen --enable=gochecknoglobals --enable=gochecknoinits --enable=gocognit --enable=goconst --enable=gocritic --enable=gocyclo --enable=godot --enable=godox --enable=goerr113 --enable=gofmt --enable=gofumpt --enable=goimports --enable=gomnd \
        --enable=gomoddirectives --enable=gomodguard --enable=goprintffuncname --enable=gosec --enable=grouper --enable=ifshort --enable=importas --enable=lll --enable=maintidx --enable=makezero --enable=misspell --enable=nestif --enable=nilerr --enable=nilnil --enable=noctx --enable=nolintlint --enable=nosprintfhostport --enable=paralleltest --enable=prealloc --enable=predeclared --enable=promlinter --enable=rowserrcheck --enable=sqlclosecheck --enable=tenv --enable=testpackage --enable=thelper --enable=tparallel --enable=unconvert --enable=unparam --enable=wastedassign --enable=whitespace --enable=wrapcheck

# audit dependencies
audit: tools
    go install github.com/sonatype-nexus-community/nancy@latest
    go list -json -m all | nancy sleuth

# run precommit checks
precommit: lint test audit

# show list of all todos left in code
@todo: (_tool-exists rg)
    rg 'TODO' --glob '**/*' || echo 'All done!'

# install into GOPATH
@install:
    go install ./cmd/app/

# run postgres cli
@psql:
    docker exec -ti postgres psql

ENV_FILE_PARAM := if $(ls .env || true) == ".env" {"--env-file .env"} else {""}

# run dockerized server on specified port
docker-server port:
    docker compose up --build --rm -it -p {{port}}:$(PORT) $(ENV_FILE_PARAM)

# list outdated dependencies
outdated:
    go install github.com/psampaz/go-mod-outdated@latest
    go list -u -m -json all | go-mod-outdated -update -direct
```

- every command should have docstring like so:
```makefile
# this rule does something
rule:
```
- reserved rule names:
  - `help` rule must be first, in order to show it on `just` command, shows list of command with description
  - `run` run main executable with default parameters: envs, local database params and etc.
  - `lint` run linters
  - `test` run all tests that do not need any additional actions, e.g. unit tests
  - `precommit` usually just runs `lint` rule, then `test`
  - `todo` show list of `// TODO: something` comments
  - `build` build executable
  - `install` compile and install/update executable
- use dotenv files like so:
```makefile
run:
	rwenv -ie .env go run cmd/app/app.go
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
VKUTILS:=rwenv -ie .env go run main.go
```
- use `set dotenv-load` at the beginning of file to use env vars from `.env` file
- [swagger generates examples](https://github.com/moby/moby/blob/master/hack/generate-swagger-api.sh)
- [templating readme example](https://github.com/rprtr258/fimgs)
