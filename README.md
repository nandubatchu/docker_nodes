# docker_nodes

### running bitcoind
docker run --rm -d -p 8332:8332 -p 8333:8333 -v <LOCAL_DATA_DIR_PATH>:/home/bitcoin/.bitcoin --name bitcoind nandubatchu/bitcoind:0.17.1