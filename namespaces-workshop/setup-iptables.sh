#!/usr/bin/env bash

set -ex

# Share internet access between host and NS.

# Enable IP-forwarding.
echo 1 > /proc/sys/net/ipv4/ip_forward

# Flush forward rules, policy DROP by default.
iptables -P FORWARD DROP
iptables -F FORWARD

# Flush nat rules.
iptables -t nat -F

# Find the default interface.
default=$(ip route | grep default | awk '{print $5}')

# Enable masquerading of 10.200.1.0.
iptables -t nat -A POSTROUTING -s 10.200.1.0/255.255.255.0 -o $default -j MASQUERADE

# Allow forwarding between eth0 and virt1.
iptables -A FORWARD -i $default -o virt1 -j ACCEPT
iptables -A FORWARD -o $default -i virt1 -j ACCEPT
