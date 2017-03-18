REPOSITORY=dev
TAG=default
HOST_WORKDIR=$(PWD)
CONTAINER_WORKDIR=/root/dev
CONTAINER_NAME=crystal-lang-dev

build:
	docker build --tag=$(REPOSITORY):$(TAG) .

run:
	docker run \
		-v $(HOST_WORKDIR):$(CONTAINER_WORKDIR) \
		--name $(CONTAINER_NAME) \
		-it $(REPOSITORY):$(TAG) \
		/bin/bash

attach:
	docker attach $(CONTAINER_NAME)
