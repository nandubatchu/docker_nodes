FROM ubuntu:latest
# Create a user if required
RUN useradd -r zcash
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget libgomp1\
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV ZCASH_VERSION=3.0.0
ENV ZCASH_DATA=/home/zcash/.zcash
# Get the compiled binaries and extract them
RUN wget https://z.cash/downloads/zcash-${ZCASH_VERSION}-linux64-debian-stretch.tar.gz
# Verify the checksum of the tarball
RUN sha256sum zcash-${ZCASH_VERSION}-linux64-debian-stretch.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/zcash-${ZCASH_VERSION}/bin:$PATH
# Setup the home folder for the new user
RUN mkdir -p /home/zcash/.zcash-params
RUN chown zcash /home/zcash/.zcash-params
USER zcash
# Download the parameters required to create and verify shielded transactions
RUN zcash-fetch-params
# Mount volume
VOLUME ["/home/zcash/.zcash"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8232 8233 18232 18333
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["zcashd"]