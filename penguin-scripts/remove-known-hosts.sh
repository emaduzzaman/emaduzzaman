  GNU nano 7.2                                                                                  remove-known-hosts.sh
#!/bin/bash

# Known hosts file
KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"

# Check if known_hosts exists
if [ -f "$KNOWN_HOSTS_FILE" ]; then
    # Clear the file
    > "$KNOWN_HOSTS_FILE"
    echo "Cleared all entries from $KNOWN_HOSTS_FILE"
else
    echo "No known_hosts file found at $KNOWN_HOSTS_FILE"
fi




