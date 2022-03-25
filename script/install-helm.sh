#!/bin/sh

# Colors
RED="\033[31m"
BLUE="\033[34m"
YELLOW="\033[33m"
GREEN="\033[32m"
WHITE="\033[0m"
BOLD="\033[01m"

# Script
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm