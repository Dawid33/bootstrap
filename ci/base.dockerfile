
FROM ubuntu:24.04

ARG \
 DEBIAN_FRONTEND=noninteractive

 RUN apt-get update && apt-get install --no-install-recommends -y \
           npm \
           git \
           podman \
           build-essential \
           libtalloc-dev \        
    && \
    echo "**** Section cleanup ****" \
       && apt-get clean autoclean -y \
       && apt-get autoremove -y \
       && rm -rf \
           /var/lib/apt/lists/* \
           /var/tmp/* \
           /tmp/*


RUN git clone https://forgejo.dawidsobczak.com/mirror/proot /proot
WORKDIR /proot/src
RUN make && make install
ADD 06/downloads /06/downloads
ADD 07/downloads /07/downloads

SHELL [ "/usr/bin/sudo", "--", "/bin/bash", "-c" ]
