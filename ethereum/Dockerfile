FROM ubuntu:latest
# Create a user if required
RUN useradd -r ethereum
SHELL ["/bin/bash", "-c"]
# Setup and cleanup of the packages required
RUN  apt-get update \
  && apt-get install -y curl sudo\
  # Run the one line installer for parity setup
  && /bin/bash -c "bash <(curl https://get.parity.io -L) -r stable" \
  && rm -rf /var/lib/apt/lists/*
# Declare the environment variables (version, path, data-dir etc)
ENV PARITY_DATA=/home/ethereum/parity_data
# Mount volume
VOLUME ["/home/ethereum/parity_data"]
# Expose required ports (both testnet & mainnet)
EXPOSE 8545 8546 30303
# Copy and define the entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# Define the default command
CMD ["parity"]