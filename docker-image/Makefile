# saner makefile
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

SIGNATR_VERSION := $(shell 2>/dev/null curl -s https://api.github.com/repos/PRL-PRG/signatr/commits | 2>/dev/null jq -r '.[0].sha')
ifndef SIGNATR_VERSION
SIGNATR_VERSION := $(shell date +%s)
endif

SXPDB_VERSION := $(shell 2>/dev/null curl -s https://api.github.com/repos/PRL-PRG/signatr/commits | 2>/dev/null jq -r '.[0].sha')
ifndef SXPDB_VERSION
SXPDB_VERSION := $(shell date +%s)
endif

DOCKER_IMAGE_NAME := prlprg/sle22-signatr

.PHONY: all
all: image

.PHONY: image
image:
	docker build \
		--rm \
		--build-arg SIGNATR_VERSION=$(SIGNATR_VERSION) \
		--build-arg SXPDB_VERSION=$(SXPDB_VERSION) \
		-t $(DOCKER_IMAGE_NAME) .

.PHONY: upload
upload: image
	docker push $(DOCKER_IMAGE_NAME)
