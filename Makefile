ENV ?= dev

.PHONY: all
all:
	docker build --no-cache --tag oszura/smarthome-server-$(ENV) --file=Dockerfile-$(ENV) .

.PHONY: build-soft
build-soft:
	docker build --tag oszura/smarthome-server-$(ENV) --file=Dockerfile-$(ENV) .

.PHONY: run-dev
run-dev:
	docker run -it -p 3222:3222 -v $(GOPATH)/src/github.com/smart-evolution/smarthome:/root/go/src/github.com/smart-evolution/smarthome oszura/smarthome-server-dev /bin/bash

.PHONY: run-prod
run-prod:
	docker run -it -d -p 3222:3222 oszura/smarthome-server-prod /bin/bash

.PHONY: version
version:
	git tag $(V)
	./scripts/changelog.sh
	git add ./docs/changelogs/CHANGELOG_$(V).md
	git commit --allow-empty -m "Build $(V)"
	git tag --delete $(V)
	git tag $(V)

.PHONY: help
help:
	@echo  'Available tasks:'
	@echo  ''
	@echo  '* Release:'
	@echo  '- version         - Phony task. Creates changelog from latest'
	@echo  '                    git tag till the latest commit. Creates commit'
	@echo  '                    with given version (as argument) and tags'
	@echo  '                    this commit with this version. Version has to'
	@echo  '                    be passed as `V` argument with ex. `v0.0.0`'
	@echo  '                    format'.
	@echo  '                    Example: $ make version V=v0.0.0.
	@echo  ''
