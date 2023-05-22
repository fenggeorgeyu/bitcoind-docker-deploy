# docker image: https://hub.docker.com/r/lncm/bitcoind
# check image tags: https://hub.docker.com/r/lncm/bitcoind/tags
tag=v24.0.1 #for common machines
image=lncm/bitcoind
name=bitcoind

all:

pull:
	docker pull ${image}:${tag}

create:
	docker run  -it  --detach \
	-v ~/.bitcoin:/data/.bitcoin \
	-p 8332:8332 \
	-p 8333:8333 \
	-p 28332:28332 \
	-p 28333:28333 \
	--name bitcoind \
	${image}:${tag}

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




