FROM ubuntu:latest
# Setup and cleanup of the packages required
RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV DECRED_VERSION=1.4.0
ENV DECRED_DATA=/root/.dcrwallet
# Get and run the installer to get the compiled binaries
RUN wget https://github.com/decred/decred-release/releases/download/v${DECRED_VERSION}/dcrinstall-linux-amd64-v${DECRED_VERSION}
RUN chmod u+x dcrinstall-linux-amd64-v${DECRED_VERSION} && ./dcrinstall-linux-amd64-v${DECRED_VERSION} -downloadonly
# Extract the tarball and cleanup the workspace
RUN cd /tmp/decred* && tar -xzf *.tar.gz -C /opt && rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/decred-linux-amd64-v${DECRED_VERSION}/:$PATH
# Mount volume
VOLUME ["/root/.dcrwallet"]
# Expose required ports (both testnet & mainnet)
EXPOSE 9110
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["dcrwallet"]
