strace
======

[![Build Status](https://travis-ci.org/brimstone/docker-strace.svg?branch=master)](https://travis-ci.org/brimstone/docker-strace)

Usage
=====
Create the strace container for usage as a volume
```
docker create --name strace brimstone/strace
```
Pick any image
```
image="brimstone/vim-static"
```
Run strace in the context of that image
```
docker run --rm -it \
	--volumes-from strace \
	--entrypoint=/opt/strace/bin/strace \
	-v $PWD:$PWD \
	-w $PWD \
	-u $UID:$GID \
	"$image" \
	-e open \
	-o strace.log \
	$(docker inspect -f '{{range .Config.Entrypoint}}{{.}} {{end}}' "$image")
	$(docker inspect -f '{{range .Config.Cmd}}{{.}} {{end}}' "$image")
```
