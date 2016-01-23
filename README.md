strace
======

[![Build Status](https://travis-ci.org/brimstone/docker-strace.svg?branch=master)](https://travis-ci.org/brimstone/docker-strace)

Usage
=====
```
docker run --rm -it \
	--volumes-from strace \
	--entrypoint=/opt/strace/bin/strace \
	-v $PWD:$PWD \
	-w $PWD \
	-u $UID:$GID \
	brimstone/vim-static \
	-e open \
	-o strace.log \
	/opt/vim/bin/vim
```
