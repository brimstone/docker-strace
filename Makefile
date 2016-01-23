strace:
	docker build -t strace-builder .
	docker run --rm strace-builder > strace.tar
	docker build -t brimstone/strace -f Dockerfile.static .

travis: strace
	@[ -f ${HOME}/.dockercfg ] || docker login -e="${DOCKER_EMAIL}" -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
	docker push brimstone/strace
