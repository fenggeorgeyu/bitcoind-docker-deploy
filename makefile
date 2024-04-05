# docker image: https://hub.docker.com/r/lncm/bitcoind
# check image tags: https://hub.docker.com/r/lncm/bitcoind/tags
tag=v24.0.1 #for common machines
image=lncm/bitcoind
name=bitcoind
repo_dir=$(shell pwd)
ln_vol=~/.bitcoin

all:

pull:
	docker pull ${image}:${tag}

# ports: mainnet, testnet, regtest net
## network: 8333, 18333, 18444
## rpc: 8332, 18332, 18443
## for transactions and blocks: 28332 28333

create:
	#[ -d ${ln_vol} ] || ln -s ${repo_dir}/_bitcoin ${ln_vol}
	docker run  -it  --detach \
	-v ~/.bitcoin:/data/.bitcoin \
	-p 8332:8332 \
	-p 8333:8333 \
	-p 18332:18332 \
	-p 18333:18333 \
	-p 18443:18443 \
	-p 18444:18444 \
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

