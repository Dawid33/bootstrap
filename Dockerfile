FROM data.forgejo.org/oci/node:20-bullseye
COPY . /code/
WORKDIR /code
CMD ["/code/busybox", "ash", "/code/initboot.sh"]
