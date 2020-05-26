FROM ubuntu:latest
# Create a user if required
RUN useradd -r bitcoinabc
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV BITCOIN_ABC_VERSION=0.21.7
ENV BITCOIN_ABC_DATA=/home/bitcoinabc/.bitcoinabc
# Get the compiled binaries and extract them
RUN wget https://download.bitcoinabc.org/${BITCOIN_ABC_VERSION}/linux/bitcoin-abc-${BITCOIN_ABC_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/bitcoin-abc-${BITCOIN_ABC_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/bitcoinabc/.bitcoinabc"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8332 8333 18332 18333 18443 18444
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["bitcoind"]