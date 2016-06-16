all:
	@echo convenience makefile

.PHONY: test
test:
	chef exec foodcritic -t ~FC064 --epic-fail any ./
	chef exec rubocop
	chef exec kitchen test --concurrency --destroy=always
