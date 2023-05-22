# bitcoind-docker-deploy
deploy a bitcoind

Your local `~/.bitcoin` is mounted as `/data/.bitcoin` in your container.

# use GNU make to control containers

- pull image
  - `make pull`
  - this will pull the bitcoind container image from dockerhub
- create container
  - `make create`
  - this will run a bitcoind server in docker
- login the shell of the container
  - `make shell`
- stop the container
  - `make stop`
- delete the containter
  - `make delete`



# Acknowledgement

- image from: `lncm/bitcoind` in dockerhub