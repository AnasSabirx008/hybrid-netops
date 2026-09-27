#!/bin/sh

set -eu

echo "=================================="
echo " Starting HybridNetOps Router"
echo "=================================="

echo
echo "[+] Enabling IPv4 forwarding"

sysctl -w net.ipv4.ip_forward=1 || true

echo
echo "[+] Router interfaces"

ip addr

echo
echo "[+] Router routes"

ip route

echo
echo "[+] Router started"

exec sleep infinity
