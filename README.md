# bitcoind-docker-deploy
deploy a bitcoind

Your local `~/.bitcoin` is mounted as `/data/.bitcoin` in your container.

# use GNU make to control containers

1. pull image
    - `make pull`
    - this will pull the bitcoind container image from dockerhub
2. create container
     - `make create`
     - this will run a bitcoind server in docker
3. login the shell of the container
     - `make shell`
4. stop the container
     - `make stop`
5. delete the containter
     - `make delete`

# Examples (interact):

```shell
docker exec -it bitcoind bitcoind --help
docker exec -it bitcoind bitcoind --version
docker exec -it bitcoind bitcoin-cli --help
docker exec -it bitcoind bitcoin-cli -getinfo
docker exec -it bitcoind bitcoin-cli getblockcount
```


# Acknowledgement

- image from: `lncm/bitcoind` in dockerhub