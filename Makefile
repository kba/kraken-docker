DOCKER_TAG = kbai/kraken

kraken:
	git submodule init
	git submodule update

.PHONY: docker
docker:
	docker build -t "$(DOCKER_TAG)" .
