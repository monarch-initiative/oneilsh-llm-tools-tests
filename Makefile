# With credit to Sierra Moxon: https://github.com/geneontology/go-fastapi/blob/main/Makefile
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help

all: install export-requirements jupyter-server


jupyter-server:
	export $(shell cat .env | grep -v ^# | xargs)
	poetry run jupyter notebook

export-requirements:
	poetry export -f requirements.txt --output requirements.txt

install:
	poetry install


help:
	@echo ""
	@echo "make all -- installs requirements, exports requirements.txt, runs jupyter notebook"
	@echo "make jupyter-server -- runs the jupyter notebook server"
	@echo "make install -- runs poetry install"
	@echo "make export-requirements -- exports requirements.txt"
	@echo "make help -- show this help"
	@echo ""

