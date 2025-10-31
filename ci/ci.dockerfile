FROM ubuntu:24.04

ARG \
 DEBIAN_FRONTEND=noninteractive

 RUN apt-get update && apt-get install --no-install-recommends -y \
           npm \
           sudo \
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
RUN mkdir /06
ADD 06/downloads /06
RUN mkdir /07
ADD 07/downloads /07

# Configure user 
ARG \
 USER_NAME=ubuntu \
 USER_PASSWORD=ubuntu \
 USER_UID=1000

RUN \
    echo "**** Create a non-root user with sudo privileges ****" \     
       && getent group ${USER_NAME} \
           || groupadd -g ${USER_UID} ${USER_NAME} \
       && id -u ${USER_NAME} &>/dev/null \
           || useradd -m -l -s /bin/bash -u ${USER_UID} -g ${USER_UID} ${USER_NAME} \
       && usermod -aG sudo ${USER_NAME} \
       && echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd \ 
       && grep -q "^${USER_NAME} ALL=(ALL) NOPASSWD: ALL" /etc/sudoers \
           || echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to non-root user.
USER ${USER_NAME}

SHELL [ "/usr/bin/sudo", "--", "/bin/bash", "-c" ]
