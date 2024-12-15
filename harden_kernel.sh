#!/bin/bash
cp /etc/sysctl.conf /etc/sysctl.conf.backup.$(date +%F)
cat <<EOT >> /etc/sysctl.conf
# Disable IP forwarding
net.ipv4.ip_forward = 0
net.ipv6.conf.all.forwarding = 0

# Protect against SYN flood attacks
net.ipv4.tcp_syncookies = 1

# Disable source routing (which attackers use to spoof IP addresses)
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0


EOT
sysctl -p

echo "disable IP packet forwarding and prevent spoofing"


