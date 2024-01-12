# bitcoind-docker-deploy
deploy a bitcoind

## data folder

The folder `_bitcoin/` in this repo is linked as `~/.bitcoin/` on your local machine so that both docker and a standard alone bitcoin core client can share the same folder. The local `~/.bitcoin` is mounted as `/data/.bitcoin` in the container.

## bitcoin network

Check the `bitcoin.conf` file in the `_bitcoin/` folder.


- `testnet=1` (the initial setting of this repo) will connect to the test net. The test net is designed as a safer testing environment for developers.
- `regtest=1` connect to the "regtest" net
- If no network parameter is given, or uncommenting the above two parameters, the bitcoin core client will by default connect to the main net.


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