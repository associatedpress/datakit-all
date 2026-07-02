.PHONY: clean clean-build clean-pyc dist check-release test-release release install help
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: clean-build clean-pyc ## remove all build and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

dist: clean ## build source and wheel package
	uv build
	ls -l dist

check-release: dist ## check release for potential errors
	uv publish --dry-run dist/*

test-release: clean dist ## release distros to test.pypi.org
	uv publish --publish-url https://test.pypi.org/legacy/ dist/*

release: clean dist ## package and upload a release
	uv publish dist/*

install: clean ## install the bundle into the active environment
	uv pip install .
