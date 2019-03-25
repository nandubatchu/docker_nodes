# docker_nodes

### running bitcoind
```
docker run --rm -d -p 8332:8332 -p 8333:8333 -v <LOCAL_DATA_DIR_PATH>:/home/bitcoin/.bitcoin --name bitcoind nandubatchu/bitcoind:0.17.1
```

### running parity
Need to create a `config.toml` inside the data directory before spinning up the container. Would require to allow RPC to communicate with the node. (Reference: https://paritytech.github.io/parity-config-generator/)

```
docker run --rm -d -p 8545:8545 -p 30303:30303 -v <LOCAL_DATA_DIR_PATH>:/home/ethereum/parity_data --name parity nandubatchu/parity-ethereum:latest
```