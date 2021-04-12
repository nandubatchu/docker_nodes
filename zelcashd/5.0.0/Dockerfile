FROM ubuntu:latest
# Create a user if required
RUN useradd -r zelcash
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget libgomp1\
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV ZELCASH_VERSION=5.0.0
ENV ZELCASH_DATA=/home/zelcash/.zelcash
# Get the compiled binaries and extract them
RUN ZELCASH_VERSION_SHORT=
RUN wget https://github.com/zelcash/zelcash/releases/download/v${ZELCASH_VERSION}/Zel-amd64-v${ZELCASH_VERSION}.tar.gz
# # Verify the checksum of the tarball
# RUN sha256sum zelcash-${ZELCASH_VERSION}-linux64.tar.gz
RUN mkdir -p /opt/zelcash/bin
RUN tar -xzf *.tar.gz -C /opt/zelcash/bin
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/zelcash/bin:$PATH
# Setup the home folder for the new user
RUN mkdir -p /home/zelcash/.zcash-params
RUN chown zelcash /home/zelcash/.zcash-params
RUN chown -R zelcash /opt/zelcash/bin
USER zelcash
# Download the parameters required to create and verify shielded transactions
RUN fetch-params.sh
# Mount volume
VOLUME ["/home/zelcash/.zelcash"]
# Expose required ports (both testnet & mainnet)
EXPOSE 16124 16125 26124 26125
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["zelcashd"]