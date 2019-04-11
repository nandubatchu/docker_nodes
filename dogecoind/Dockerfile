FROM ubuntu:latest
# Create a user if required
RUN useradd -r dogecoin
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV DOGECOIN_VERSION=1.10.0
ENV DOGECOIN_DATA=/home/dogecoin/.dogecoin
# Get the compiled binaries and extract them
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-linux64.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/dogecoin-${DOGECOIN_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/dogecoin/.dogecoin"]
# Expose required ports (both testnet & mainnet)
EXPOSE 22555 22556 44555 44556
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["dogecoind"]