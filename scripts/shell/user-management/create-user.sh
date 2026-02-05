#!/bin/bash

# Simple user creation script (Ubuntu-like defaults) in enterprise linux

# Must be root
if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root"
    exit 1
fi

# Check username argument
if [[ -z "$1" ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME="$1"

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists"
    exit 1
fi

# Create user with default settings
useradd -m -s /bin/bash "$USERNAME" || {
    echo "Failed to create user"
    exit 1
}

# Set password
echo "Set password for $USERNAME:"
passwd "$USERNAME" || {
    echo "Failed to set password"
    exit 1
}

echo "User '$USERNAME' created successfully"
echo "Home directory: /home/$USERNAME"
echo "Shell: /bin/bash"
