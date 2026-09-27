FROM alpine:3.22

RUN apk add --no-cache \
    iproute2 \
    iputils \
    curl \
    tcpdump \
    bash

COPY --chmod=755 /dev/stdin /entrypoint.sh <<'EOF'
#!/bin/sh

set -eu

echo "Starting admin-client"

ip route del default 2>/dev/null || true

ip route add default via 10.20.10.1 2>/dev/null || true

echo
echo "Interfaces:"
ip addr

echo
echo "Routes:"
ip route

echo
echo "Admin client ready"

exec sleep infinity
EOF

ENTRYPOINT ["/entrypoint.sh"]
