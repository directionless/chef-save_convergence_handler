all:
	@echo convenience makefile. Try `make test`

.PHONY: test
test:
	chef exec foodcritic -t ~FC064 --epic-fail any ./
	chef exec cookstyle
	chef exec rspec
	rm -rf Berksfile.lock
	chef exec kitchen diagnose --all
	chef exec kitchen test --concurrency --destroy=always

