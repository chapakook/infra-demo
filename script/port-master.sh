#!/bin/sh

# Colors
RED="\033[31m"
BLUE="\033[34m"
YELLOW="\033[33m"
GREEN="\033[32m"
WHITE="\033[0m"
BOLD="\033[01m"

# Script

sudo iptables -I INPUT -p tcp --dport 6443 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 2379:2380 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 10250 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 10259 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 10257 -j ACCEPT

sudo netfilter-persistent save