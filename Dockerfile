# ------------------------------------------------------------------------------
# Build python xxhash module
FROM ubuntu:jammy AS pybuild
ENV XXHASHURL https://files.pythonhosted.org/packages/24/90/666a4d4d96a93ddaaaa0142ef8c1bd20f7135a7f1114a894f4d6efac16c5/xxhash-3.2.0.tar.gz
RUN apt-get update && \
	apt-get install -y build-essential python3-dev python3-setuptools wget && \
	wget ${XXHASHURL} && \
	tar xvf xxhash-*.tar.gz && \
	cd xxhash-* && \
	python3 setup.py install

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
      nano \
      pbzip2 \
      pigz \
      pixz \
      plzip \
      silversearcher-ag \
      sqlite3 \
      supervisor \
      unzip \
      xxhash \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install python xxhash module from build container
COPY --from=pybuild /usr/local/lib/python3.10 /usr/local/lib/python3.10

# ------------------------------------------------------------------------------
# Define default entrypoint
CMD ["/bin/bash"]
