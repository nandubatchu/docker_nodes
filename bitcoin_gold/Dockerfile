FROM ubuntu:latest
# Create a user if required
RUN useradd -r bitcoingold
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV BITCOIN_GOLD_VERSION=0.15.2
ENV BITCOIN_GOLD_DATA=/home/bitcoingold/.bitcoingold
# Get the compiled binaries and extract them
RUN wget https://github.com/BTCGPU/BTCGPU/releases/download/v${BITCOIN_GOLD_VERSION}/bitcoin-gold-${BITCOIN_GOLD_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/bitcoin-gold-${BITCOIN_GOLD_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/bitcoingold/.bitcoingold"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8332 8333 18332 18333 18443 18444
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["bgoldd"]