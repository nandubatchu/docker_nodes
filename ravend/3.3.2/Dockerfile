FROM ubuntu:latest
# Create a user if required
RUN useradd -r raven
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV RAVEN_VERSION=3.3.2
ENV RAVEN_BINARIES=3.3.2.0
ENV RAVEN_DATA=/home/raven/.raven
# Get the compiled binaries and extract them
RUN wget https://github.com/RavenProject/Ravencoin/releases/download/v${RAVEN_VERSION}/raven-${RAVEN_BINARIES}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/raven-${RAVEN_BINARIES}/bin:$PATH
# Mount volume
VOLUME ["/home/raven/.raven"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8766 8767 18766 18767
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["ravend"]