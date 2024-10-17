TAG=latest

all: push

build:
	docker buildx build -t occrp/alfred-elasticsearch:$(TAG) .

run: build
	docker run -ti occrp/alfred-elasticsearch:$(TAG) bash

exec: build
	docker run -ti -v $(PWD)/secrets:/secrets occrp/alfred-elasticsearch:$(TAG)

push: build
	docker push occrp/alfred-elasticsearch:$(TAG)
