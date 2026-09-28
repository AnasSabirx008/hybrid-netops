#!/bin/sh

set -eu

echo "=================================="
echo " Starting admin-client"
echo "=================================="

echo
echo "[+] Configuring default route"

ip route del default 2>/dev/null || true
ip route add default via 10.20.10.1 2>/dev/null || true

echo
echo "[+] Interfaces"
ip addr

echo
echo "[+] Routes"
ip route

echo
echo "[+] Admin client ready"

exec sleep infinity
