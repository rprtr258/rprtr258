boilerplate to copy and use:
```makefile
@_help:
	just --list --unsorted

# run app
@run:
	go run cmd/app/app.go

# run unit tests
@test:
	go test ./...

# run linter
@lint:
	golangci-lint run --exclude-use-default=false --disable-all \
		--enable=revive --enable=deadcode --enable=errcheck --enable=govet --enable=ineffassign --enable=structcheck --enable=typecheck --enable=varcheck --enable=asciicheck --enable=bidichk --enable=bodyclose --enable=containedctx --enable=contextcheck --enable=cyclop --enable=decorder --enable=depguard --enable=dogsled --enable=dupl --enable=durationcheck --enable=errchkjson --enable=errname --enable=errorlint --enable=execinquery --enable=exhaustive --enable=exhaustruct --enable=exportloopref --enable=forbidigo --enable=forcetypeassert --enable=funlen --enable=gochecknoglobals --enable=gochecknoinits --enable=gocognit --enable=goconst --enable=gocritic --enable=gocyclo --enable=godot --enable=godox --enable=goerr113 --enable=gofmt --enable=gofumpt --enable=goimports --enable=gomnd \
		--enable=gomoddirectives --enable=gomodguard --enable=goprintffuncname --enable=gosec --enable=grouper --enable=ifshort --enable=importas --enable=lll --enable=maintidx --enable=makezero --enable=misspell --enable=nestif --enable=nilerr --enable=nilnil --enable=noctx --enable=nolintlint --enable=nosprintfhostport --enable=paralleltest --enable=prealloc --enable=predeclared --enable=promlinter --enable=rowserrcheck --enable=sqlclosecheck --enable=tenv --enable=testpackage --enable=thelper --enable=tparallel --enable=unconvert --enable=unparam --enable=wastedassign --enable=whitespace --enable=wrapcheck

# run precommit checks
precommit: lint test

# show list of all todos left in code
@todo:
	rg 'TODO' --glob '**/*' || echo 'All done!'

# install into GOPATH
@install:
	go install ./cmd/app/

# install templating tool
_tools-mustpl:
    curl -SsL -o ./mustpl https://github.com/tarampampam/mustpl/releases/latest/download/mustpl-linux-amd64
    chmod +x ./mustpl
    sudo install -g root -o root -t /usr/local/bin -v ./mustpl
    rm ./mustpl

# install dotenv tool
_tools-rwenv:
    go install github.com/rprtr258/rwenv

# install development tools
tools: _tools-mustpl _tools-rwenv

USAGE := `go run cmd/fimgs/fimgs.go --help`
EXAMPLES := `echo 'some examples'`
# compile readme file from template
@readme:
    mustpl -d '{"usage": "{{USAGE}}", "examples": "{{EXAMPLES}}"}' img/README.md.tpl > README.md
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
