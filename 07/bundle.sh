#!/bin/sh

tar -cpf fs.tar -C fs .
podman import fs.tar --arch amd64 redox-toolchain-bootstrap
podman push dawids/redox-toolchain-bootstrap:testing docker://forgejo.dawidsobczak.com/dawids/redox-toolchain-bootstrap:testing
