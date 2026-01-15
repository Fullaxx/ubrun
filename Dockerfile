# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:noble
LABEL author="Brett Kuskie <fullaxx@gmail.com>"

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# ------------------------------------------------------------------------------
# Prepare Python requirements.txt
COPY requirements.txt /install/requirements.txt

# ------------------------------------------------------------------------------
# Create a docker image suitable for runtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      calc \
      dtach \
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
      python3-pip \
      run-one \
      screen \
      silversearcher-ag \
      sqlite3 \
      supervisor \
      tcpdump \
      tmux \
      tshark \
      unzip \
      vim-tiny \
      xxhash \
      zip \
      zlib1g && \
    rm /usr/lib/python3*/EXTERNALLY-MANAGED && \
    pip3 install -r /install/requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Define default command
CMD ["/bin/bash"]
