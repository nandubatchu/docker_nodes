FROM ubuntu:latest
# Create a user if required
RUN useradd -r digibyte
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV DIGIBYTE_VERSION=7.17.2
ENV DIGIBYTE_DATA=/home/digibyte/.digibyte
# Get the compiled binaries and extract them
RUN wget https://github.com/DigiByte-Core/digibyte/releases/download/v${DIGIBYTE_VERSION}/digibyte-${DIGIBYTE_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/digibyte-${DIGIBYTE_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/digibyte/.digibyte"]
# Expose required ports (both testnet & mainnet)
EXPOSE 12024 14022 12026 14023 18444 18443
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["digibyted"]