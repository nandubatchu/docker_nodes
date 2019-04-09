FROM ubuntu:latest
# Create a user if required
RUN useradd -r monero
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV MONERO_VERSION=0.14.0.2
ENV MONERO_DATA=/home/monero/.bitmonero
# Get the compiled binaries and extract them
RUN wget https://dlsrc.getmonero.org/cli/monero-linux-x64-v${MONERO_VERSION}.tar.bz2
RUN tar -xjf *.tar.bz2 -C /opt
# Cleanup the workspace
RUN rm *.tar.bz2
# Append the bin folder to the %PATH%
ENV PATH=/opt/monero-v${MONERO_VERSION}:$PATH
# Mount volume
VOLUME ["/home/monero/.bitmonero"]
# Expose required ports (both testnet & mainnet)
EXPOSE 18088 28088
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["monero-wallet-rpc"]