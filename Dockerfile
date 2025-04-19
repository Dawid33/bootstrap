FROM alpine:3.21.3
RUN apk update && apk upgrade && apk add --no-cache make bash wget coreutils
COPY . /code
WORKDIR /code
RUN make
