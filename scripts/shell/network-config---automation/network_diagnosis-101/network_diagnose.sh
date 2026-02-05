#!/bin/bash
echo "==========================================="
echo "🔍 Network Diagnostic Script Starting..."
echo "==========================================="

# Function to run and display command output nicely
run_cmd() {
    echo
    echo ">>> $1"
    echo "-------------------------------------------"
    eval "$1"
}

# 1️⃣ Check system hostname and network interfaces
run_cmd "hostname -I"
run_cmd "ip addr show"
run_cmd "ip link show"

# 2️⃣ Check routing table
run_cmd "ip route show"

# 3️⃣ Check DNS configuration
run_cmd "cat /etc/resolv.conf"

# 4️⃣ Test local network connectivity (gateway ping)
echo
read -p "Enter your Gateway IP (e.g., 192.168.1.1): " GATEWAY
if [[ -n "$GATEWAY" ]]; then
    run_cmd "ping -c 4 $GATEWAY"
else
    echo "⏭ Skipped gateway ping test."
fi

# 5️⃣ Test external connectivity (Google DNS)
run_cmd "ping -c 4 8.8.8.8"

# 6️⃣ Test DNS resolution
run_cmd "ping -c 4 google.com"

# 7️⃣ Show active network connections
run_cmd "netstat -tuln || ss -tuln"

# 8️⃣ Check if default gateway exists
echo
DEFAULT_GW=$(ip route | grep default | awk '{print $3}')
if [[ -n "$DEFAULT_GW" ]]; then
    echo "✅ Default gateway detected: $DEFAULT_GW"
else
    echo "⚠️ No default gateway found!"
fi

# 9️⃣ Show system uptime and date
run_cmd "uptime"
run_cmd "date"

echo
echo "==========================================="
echo "✅ Network Diagnostics Completed."
echo "Results saved above."
echo "==========================================="
