DOCKER_TAG = kbai/kraken

docker:
	docker build -t "$(DOCKER_TAG)" .

pull:
	cd kraken && git pull
