SHELL := /bin/bash

.PHONY: all

PROJECT:= meditatinos
BUILD_DATE=$(shell TZ=UTC date -u '+%Y-%m-%dT%H:%M:%SZ')
GIT_HASH=$(shell git rev-parse --short HEAD)
PLATFORM := $(shell uname|tr '[:upper:]' '[:lower:]')
ARCH := amd64
AWS_ACCOUNT_ID=$(shell aws sts get-caller-identity --query Account --output text)
AWS_REGION=$(shell aws configure get region)
ECR_CRAWLER_REPO=lsgrep/meditations

publish:
	quarto render
	git checkout docs/CNAME
	git add --all
	git commit -m "action"
	git push

site:
	quarto preview .
