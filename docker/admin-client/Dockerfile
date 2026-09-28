FROM alpine:3.22

RUN apk add --no-cache \
    iproute2 \
    iputils \
    curl \
    tcpdump \
    bash

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
