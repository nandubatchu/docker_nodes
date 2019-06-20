FROM ubuntu:latest
# Create a user if required
RUN useradd -r dashcore
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV DASHCORE_VERSION=0.14.0.1
ENV DASHCORE_BINARIES=0.14.0
ENV DASHCORE_DATA=/home/dashcore/.dashcore
# Get the compiled binaries and extract them
RUN wget https://github.com/dashpay/dash/releases/download/v${DASHCORE_VERSION}/dashcore-${DASHCORE_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzf *.tar.gz -C /opt
# Cleanup the workspace
RUN rm *.tar.gz
# Append the bin folder to the %PATH%
ENV PATH=/opt/dashcore-${DASHCORE_BINARIES}/bin:$PATH
# Mount volume
VOLUME ["/home/dashcore/.dashcore"]
# Expose required ports (both testnet & mainnet)
EXPOSE 9998 9999 19998 19999
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["dashd"]