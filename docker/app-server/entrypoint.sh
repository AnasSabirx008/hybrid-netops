#!/bin/sh

set -eu

echo "Starting app-server"

ip route del default 2>/dev/null || true

ip route add default via 10.20.20.1 2>/dev/null || true

echo
echo "Interfaces:"
ip addr

echo
echo "Routes:"
ip route

echo
echo "Starting application"

exec python app.py
