# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:focal
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Create a docker image suitable for runtime
RUN apt-get update && \
    apt-get install -y \
      libcurl4 \
      libevent-2.1-7 \
      libgcrypt20 \
      libhiredis0.14 \
      libmicrohttpd12 \
      libpcap0.8 \
      sqlite3 \
      libssl1.1 \
      libwebsockets15 \
      libxml2 \
      libzmq5 \
      xxhash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Define default entrypoint
CMD ["/bin/bash"]
