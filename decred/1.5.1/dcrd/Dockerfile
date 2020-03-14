FROM ubuntu:latest
# Setup and cleanup of the packages required
RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV DECRED_VERSION=1.5.1
ENV DECRED_DATA=/root/.dcrd/data
# Get and run the installer to get the compiled binaries
RUN wget https://github.com/decred/decred-release/releases/download/v${DECRED_VERSION}/dcrinstall-linux-amd64-v${DECRED_VERSION}
RUN chmod u+x dcrinstall-linux-amd64-v${DECRED_VERSION} && ./dcrinstall-linux-amd64-v${DECRED_VERSION} -downloadonly
# Extract the tarball and cleanup the workspace
RUN cd /tmp/decred* && tar -xzf *.tar.gz -C /opt && rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/decred-linux-amd64-v${DECRED_VERSION}/:$PATH
# Mount volume
VOLUME ["/root/.dcrd"]
# Expose required ports (both testnet & mainnet)
EXPOSE 9108 9109 19108 19109
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["dcrd"]