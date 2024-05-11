# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:jammy
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Create a docker image suitable for runtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      hping3 \
      iproute2 \
      iputils-ping \
      jq \
      less \
      libcurl4 \
      libevent-2.1-7 \
      libgcrypt20 \
      libhiredis0.14 \
      libmicrohttpd12 \
      libnet1 \
      libpcap0.8 \
      libssl3 \
      libwebsockets16 \
      libxml2 \
      libzmq5 \
      lbzip2 \
      lrzip \
      lsof \
      nano \
      net-tools \
      pbzip2 \
      pigz \
      pixz \
      plzip \
      pv \
      run-one \
      screen \
      silversearcher-ag \
      sqlite3 \
      supervisor \
      tcpdump \
      tmux \
      unzip \
      vim-tiny \
      xxhash \
      zip \
      zlib1g && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install python modules and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    python3 -m pip install redis[hiredis] pandas==2.1.4 pyzmq xxhash && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Define default entrypoint
CMD ["/bin/bash"]
