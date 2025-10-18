#!/bin/bash
# user.sh - Add a new user with sudo access

if [ -z "$1" ]; then
  echo "Usage: $0 username"
  exit 1
fi

USERNAME=$1

sudo useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:password" | sudo chpasswd
sudo usermod -aG sudo $USERNAME

echo "User $USERNAME created with sudo access."

