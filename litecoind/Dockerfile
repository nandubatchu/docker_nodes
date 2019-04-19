FROM ubuntu:latest
# Create a user if required
RUN useradd -r litecoin
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV LITECOIN_VERSION=0.16.3
ENV LITECOIN_DATA=/home/litecoin/.litecoin
# Get the compiled binaries and extract them
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/litecoin-${LITECOIN_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/litecoin/.litecoin"]
# Expose required ports (both testnet & mainnet)
EXPOSE 9332 9333 19332 19335 19444
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["litecoind"]