# docker_nodes

### running bitcoind
Configuration file `bitcoin.conf` should be placed in the data directory before spinning up the container.
```
docker run --rm -d -p 8332:8332 -p 8333:8333 -v <LOCAL_DATA_DIR_PATH>:/home/bitcoin/.bitcoin --name bitcoind nandubatchu/bitcoind:0.17.1
```

### running litecoind
Configuration file `litecoin.conf` should be placed in the data directory before spinning up the container
```
docker run --rm -d -p 9332:9332 -p 9333:9333 -v <LOCAL_DATA_DIR_PATH>:/home/litecoin/.litecoin --name litecoind nandubatchu/litecoind:0.16.3
```


### running parity
Need to create a `config.toml` inside the data directory before spinning up the container. Would require to allow RPC to communicate with the node. (Reference: https://paritytech.github.io/parity-config-generator/)

```
docker run --rm -d -p 8545:8545 -p 30303:30303 -v <LOCAL_DATA_DIR_PATH>:/home/ethereum/parity_data --name parity nandubatchu/parity-ethereum:latest
```

### running monero-wallet-rpc
Need to create a `monero-wallet-cli.conf` inside the data directory before spinning up the container.
Also would need to generate the wallet files using the `monero-wallet-cli` and be placed in the `/wallet-dir` path under the data directory to be accessed by the RPC commands.
```
docker run --rm -d -p 18088:18088 -v <LOCAL_DATA_DIR_PATH>:/home/monero/.bitmonero --name monero-waller-rpc nandubatchu/monero-wallet-rpc:0.14.0.2
```

### running monerod
Need to create a `monerod.conf` inside the data directory before spinning up the container.
```
docker run --rm -d -p 18080:18080 -p 18081:18081 -v <LOCAL_DATA_DIR_PATH>:/home/monero/.bitmonero --name monerod nandubatchu/monerod:0.14.0.2
```

### running dogecoind
Configuration file `dogecoin.conf` should be placed in the data directory before spinning up the container
```
docker run --rm -d -p 22555:22555 -p 22556:22556 -v <LOCAL_DATA_DIR_PATH>:/home/dogecoin/.dogecoin --name dogecoind nandubatchu/dogecoind:1.10.0
```

### running zcashd
Configuration file `zcash.conf` should be placed in the data directory before spinning up the container
```
docker run --rm -d -p 8232:8232 -p 8233:8233 -v <LOCAL_DATA_DIR_PATH>:/home/zcash/.zcash --name zcashd nandubatchu/zcashd:2.0.4
```

### running qtumd
Configuration file `qtum.conf` should be placed in the data directory before spinning up the container
```
docker run --rm -d -p 3888:3888 -p 3889:3889 -v <LOCAL_DATA_DIR_PATH>:/home/qtum/.qtum --name qtumd nandubatchu/qtumd:0.17.2
```