#!/bin/sh
set -eu

ROUTER="edge-router"

ADMIN_NET="10.20.10.0/24"
SERVERS_NET="10.20.20.0/24"

echo "[+] Applying HybridNetOps firewall"

# Reset FORWARD chain
docker exec "$ROUTER" iptables -F FORWARD

# Default deny
docker exec "$ROUTER" iptables -P FORWARD DROP

# Allow return traffic
docker exec "$ROUTER" iptables -A FORWARD \
  -m conntrack --ctstate ESTABLISHED,RELATED \
  -j ACCEPT

# ADMIN -> SERVERS
docker exec "$ROUTER" iptables -A FORWARD \
  -s "$ADMIN_NET" \
  -d "$SERVERS_NET" \
  -m conntrack --ctstate NEW \
  -j ACCEPT

# SERVERS -> ADMIN
docker exec "$ROUTER" iptables -A FORWARD \
  -s "$SERVERS_NET" \
  -d "$ADMIN_NET" \
  -m conntrack --ctstate NEW \
  -j DROP

echo "[+] Firewall applied"
echo
echo "[+] FORWARD rules:"
docker exec "$ROUTER" iptables -L FORWARD -n -v --line-numbers
