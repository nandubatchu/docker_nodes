FROM ubuntu:latest
# Create a user if required
RUN useradd -r bitcoin
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV BITCOIN_VERSION=22.0
ENV BITCOIN_DATA=/home/bitcoin/.bitcoin
# Get the compiled binaries and extract them
RUN wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz 
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/bitcoin-${BITCOIN_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/bitcoin/.bitcoin"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8332 8333 18332 18333 18443 18444
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["bitcoind"]