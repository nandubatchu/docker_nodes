FROM ubuntu:latest
# Create a user if required
RUN useradd -r qtum
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV QTUM_VERSION=0.17.2
ENV QTUM_DATA=/home/qtum/.qtum
# Get the compiled binaries and extract them
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/qtum-${QTUM_VERSION}/bin:$PATH
# Mount volume
VOLUME ["/home/qtum/.qtum"]
# Expose required ports (both testnet & mainnet)
EXPOSE 3888 3889 13888 13889
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["qtumd"]