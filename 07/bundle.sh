#!/bin/sh

tar --to-stdout -cpf fs.tar -C fs . | podman import --arch amd64 - redox-toolchain-bootstrap:testing 
podman login --username dawids --password $DOCKER_CI_PASSWORD forgejo.dawidsobczak.com
podman push redox-toolchain-bootstrap:testing docker://forgejo.dawidsobczak.com/dawids/redox-toolchain-bootstrap:testing
