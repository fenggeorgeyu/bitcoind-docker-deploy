# docker image: https://hub.docker.com/r/lncm/bitcoind
# check image tags: https://hub.docker.com/r/lncm/bitcoind/tags
#version=v24.0.1-arm64v8 #for mac with apple chips
version=v24.0.1 #for common machines
image=lncm/bitcoind

git_dir=${HOME}/git


name=bitcoind

all:

pull:
	docker pull ${image}:${version}

create:
	docker run  -it  --rm  --detach \
	-v ~/.bitcoin:/data/.bitcoin \
    -p 8332:8332 \
    -p 8333:8333 \
    -p 28332:28332 \
    -p 28333:28333 \
    --name bitcoind \
	${image}:${version}

# --restart=always 




shell:
	docker exec -it ${name} /bin/sh

stop:
	docker stop ${name}

start:
	docker start ${name}

restart:
	docker restart ${name}

delete:
	docker rm ${name}

upgrade:
	docker pull ${image}

commit:
	git add -u
	git add .
	git commit -am 'make commit'
	git push




