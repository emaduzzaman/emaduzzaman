#!/bin/bash

#===============================================================================
#
#   Script Name:  network-diagnostics.sh
#   Description:  Comprehensive Network Diagnostic Tool for Ubuntu/Linux
#   Version:      2.0
#   Usage:        sudo bash network-diagnostics.sh [--save] [--quick]
#
#   Options:
#     --save      Save results to a log file
#     --quick     Run quick diagnostics only (skip slow tests)
#     --help      Show this help message
#
#===============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

# Configuration
SAVE_LOG=false
QUICK_MODE=false
LOG_FILE=""
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Parse arguments
for arg in "$@"; do
    case $arg in
        --save)
            SAVE_LOG=true
            LOG_FILE="/tmp/network_diagnostic_${TIMESTAMP}.log"
            ;;
        --quick)
            QUICK_MODE=true
            ;;
        --help)
            echo "Usage: sudo bash network-diagnostics.sh [--save] [--quick]"
            echo "  --save   Save results to /tmp/network_diagnostic_<timestamp>.log"
            echo "  --quick  Skip slow tests (traceroute, speed hints)"
            exit 0
            ;;
    esac
done

#===============================================================================
# Helper Functions
#===============================================================================

# Print to both screen and log file if enabled
log_output() {
    if [[ "$SAVE_LOG" == true ]]; then
        echo -e "$1" | tee -a "$LOG_FILE"
    else
        echo -e "$1"
    fi
}

print_header() {
    log_output "\n${BLUE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    log_output "${BLUE}║${NC} ${CYAN}${BOLD}$1${NC}"
    log_output "${BLUE}╚══════════════════════════════════════════════════════════════════╝${NC}\n"
}

print_subheader() {
    log_output "\n${MAGENTA}▶ $1${NC}"
    log_output "${MAGENTA}─────────────────────────────────────────${NC}"
}

print_pass() {
    log_output "${GREEN}✓ PASS:${NC} $1"
}

print_fail() {
    log_output "${RED}✗ FAIL:${NC} $1"
}

print_warn() {
    log_output "${YELLOW}⚠ WARN:${NC} $1"
}

print_info() {
    log_output "${CYAN}ℹ INFO:${NC} $1"
}

# Run command and capture output
run_cmd() {
    local desc="$1"
    local cmd="$2"
    log_output "\n${YELLOW}>>> $desc${NC}"
    log_output "${BLUE}$ $cmd${NC}"
    log_output "-------------------------------------------"
    if [[ "$SAVE_LOG" == true ]]; then
        eval "$cmd" 2>&1 | tee -a "$LOG_FILE"
    else
        eval "$cmd" 2>&1
    fi
}

# Check if command exists
cmd_exists() {
    command -v "$1" &> /dev/null
}

# Test connectivity and return status
test_ping() {
    local host="$1"
    local count="${2:-4}"
    ping -c "$count" -W 3 "$host" &> /dev/null
    return $?
}

#===============================================================================
# Main Script
#===============================================================================

clear
log_output "${CYAN}${BOLD}"
log_output "╔═══════════════════════════════════════════════════════════════════╗"
log_output "║     🔍 COMPREHENSIVE NETWORK DIAGNOSTIC TOOL v2.0                 ║"
log_output "║     $(date)                              ║"
log_output "╚═══════════════════════════════════════════════════════════════════╝"
log_output "${NC}"

if [[ "$SAVE_LOG" == true ]]; then
    print_info "Results will be saved to: $LOG_FILE"
fi

if [[ "$QUICK_MODE" == true ]]; then
    print_info "Running in QUICK mode (some tests skipped)"
fi

#===============================================================================
# Section 1: System Information
#===============================================================================
print_header "1️⃣  SYSTEM INFORMATION"

print_subheader "Hostname & OS"
log_output "Hostname:     $(hostname)"
log_output "FQDN:         $(hostname -f 2>/dev/null || echo 'N/A')"
log_output "OS:           $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'"' -f2)"
log_output "Kernel:       $(uname -r)"
log_output "Uptime:       $(uptime -p)"
log_output "Date/Time:    $(date)"
log_output "Timezone:     $(timedatectl 2>/dev/null | grep 'Time zone' | awk '{print $3}' || cat /etc/timezone 2>/dev/null)"

#===============================================================================
# Section 2: Network Interfaces
#===============================================================================
print_header "2️⃣  NETWORK INTERFACES"

print_subheader "Interface Summary"

# Get all interfaces except lo
INTERFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -v lo)

for iface in $INTERFACES; do
    STATE=$(ip link show "$iface" | grep -oP '(?<=state )\w+')
    IP=$(ip -4 addr show "$iface" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+' || echo "No IPv4")
    MAC=$(ip link show "$iface" | grep -oP '(?<=link/ether\s)[a-f0-9:]+' || echo "N/A")
    MTU=$(ip link show "$iface" | grep -oP '(?<=mtu\s)\d+')
    
    if [[ "$STATE" == "UP" ]]; then
        log_output "${GREEN}●${NC} $iface: $STATE | IP: $IP | MAC: $MAC | MTU: $MTU"
    else
        log_output "${RED}●${NC} $iface: $STATE | IP: $IP | MAC: $MAC | MTU: $MTU"
    fi
done

print_subheader "Detailed Interface Info"
run_cmd "IP Addresses" "ip -c addr show 2>/dev/null || ip addr show"

print_subheader "Interface Statistics"
for iface in $INTERFACES; do
    if [[ -d "/sys/class/net/$iface/statistics" ]]; then
        RX_BYTES=$(cat /sys/class/net/$iface/statistics/rx_bytes 2>/dev/null)
        TX_BYTES=$(cat /sys/class/net/$iface/statistics/tx_bytes 2>/dev/null)
        RX_ERRORS=$(cat /sys/class/net/$iface/statistics/rx_errors 2>/dev/null)
        TX_ERRORS=$(cat /sys/class/net/$iface/statistics/tx_errors 2>/dev/null)
        RX_DROPPED=$(cat /sys/class/net/$iface/statistics/rx_dropped 2>/dev/null)
        TX_DROPPED=$(cat /sys/class/net/$iface/statistics/tx_dropped 2>/dev/null)
        
        # Convert bytes to human readable
        RX_HR=$(numfmt --to=iec $RX_BYTES 2>/dev/null || echo "$RX_BYTES bytes")
        TX_HR=$(numfmt --to=iec $TX_BYTES 2>/dev/null || echo "$TX_BYTES bytes")
        
        log_output "\n${CYAN}$iface Statistics:${NC}"
        log_output "  RX: $RX_HR received | Errors: $RX_ERRORS | Dropped: $RX_DROPPED"
        log_output "  TX: $TX_HR sent     | Errors: $TX_ERRORS | Dropped: $TX_DROPPED"
        
        # Alert on errors
        if [[ "$RX_ERRORS" -gt 0 ]] || [[ "$TX_ERRORS" -gt 0 ]]; then
            print_warn "Interface $iface has transmission errors!"
        fi
        if [[ "$RX_DROPPED" -gt 100 ]] || [[ "$TX_DROPPED" -gt 100 ]]; then
            print_warn "Interface $iface has high dropped packets!"
        fi
    fi
done

#===============================================================================
# Section 3: Routing Information
#===============================================================================
print_header "3️⃣  ROUTING INFORMATION"

print_subheader "Default Gateway"
DEFAULT_GW=$(ip route | grep default | awk '{print $3}' | head -n1)
DEFAULT_IFACE=$(ip route | grep default | awk '{print $5}' | head -n1)

if [[ -n "$DEFAULT_GW" ]]; then
    print_pass "Default gateway: $DEFAULT_GW via $DEFAULT_IFACE"
else
    print_fail "No default gateway configured!"
fi

print_subheader "Routing Table"
run_cmd "IP Routes" "ip route show"

# Check for multiple default routes (potential issue)
DEFAULT_COUNT=$(ip route | grep -c default)
if [[ "$DEFAULT_COUNT" -gt 1 ]]; then
    print_warn "Multiple default routes detected ($DEFAULT_COUNT). This may cause issues."
fi

#===============================================================================
# Section 4: DNS Configuration
#===============================================================================
print_header "4️⃣  DNS CONFIGURATION"

print_subheader "Configured DNS Servers"
run_cmd "resolv.conf" "cat /etc/resolv.conf"

# Check systemd-resolved if available
if systemctl is-active systemd-resolved &>/dev/null; then
    print_subheader "Systemd-Resolved Status"
    run_cmd "resolvectl status" "resolvectl status 2>/dev/null | head -30"
fi

# Extract DNS servers
DNS_SERVERS=$(grep -E '^nameserver' /etc/resolv.conf | awk '{print $2}')
if [[ -z "$DNS_SERVERS" ]]; then
    print_fail "No DNS servers configured in /etc/resolv.conf"
else
    print_pass "DNS servers found: $(echo $DNS_SERVERS | tr '\n' ' ')"
fi

#===============================================================================
# Section 5: Connectivity Tests
#===============================================================================
print_header "5️⃣  CONNECTIVITY TESTS"

# Test 1: Gateway connectivity
print_subheader "Gateway Connectivity"
if [[ -n "$DEFAULT_GW" ]]; then
    log_output "Testing gateway: $DEFAULT_GW"
    if test_ping "$DEFAULT_GW" 4; then
        print_pass "Gateway $DEFAULT_GW is reachable"
        run_cmd "Gateway Ping Details" "ping -c 4 $DEFAULT_GW"
    else
        print_fail "Cannot reach gateway $DEFAULT_GW"
        print_info "Possible issues: Cable disconnected, wrong IP config, switch/router down"
    fi
else
    print_warn "Skipping gateway test - no gateway configured"
fi

# Test 2: External IP connectivity
print_subheader "External Connectivity (IP-based)"
EXTERNAL_IPS=("8.8.8.8" "1.1.1.1" "9.9.9.9")
EXTERNAL_REACHABLE=0

for ip in "${EXTERNAL_IPS[@]}"; do
    if test_ping "$ip" 2; then
        print_pass "$ip is reachable"
        EXTERNAL_REACHABLE=1
        break
    else
        print_fail "$ip is not reachable"
    fi
done

if [[ "$EXTERNAL_REACHABLE" -eq 1 ]]; then
    run_cmd "Internet Ping Test" "ping -c 4 8.8.8.8"
else
    print_fail "No external connectivity! Cannot reach any public IP."
    print_info "Check: Gateway config, NAT/firewall rules, ISP connection"
fi

# Test 3: DNS Resolution
print_subheader "DNS Resolution"
DNS_HOSTS=("google.com" "cloudflare.com" "amazon.com")
DNS_WORKING=0

for host in "${DNS_HOSTS[@]}"; do
    if host "$host" &>/dev/null || nslookup "$host" &>/dev/null || dig "$host" +short &>/dev/null; then
        print_pass "DNS resolution working ($host resolved)"
        DNS_WORKING=1
        break
    fi
done

if [[ "$DNS_WORKING" -eq 1 ]]; then
    if test_ping "google.com" 4; then
        print_pass "google.com is reachable"
        run_cmd "Domain Ping Test" "ping -c 4 google.com"
    else
        print_warn "DNS works but cannot ping google.com (ICMP may be blocked)"
    fi
else
    print_fail "DNS resolution failed!"
    print_info "Check: DNS server configuration, DNS server availability"
fi

# Test 4: DNS Server Response Time
print_subheader "DNS Server Response Time"
for dns in $DNS_SERVERS; do
    if cmd_exists dig; then
        DNS_TIME=$(dig @"$dns" google.com +stats 2>/dev/null | grep "Query time" | awk '{print $4}')
        if [[ -n "$DNS_TIME" ]]; then
            if [[ "$DNS_TIME" -lt 100 ]]; then
                print_pass "DNS $dns response: ${DNS_TIME}ms (Good)"
            elif [[ "$DNS_TIME" -lt 300 ]]; then
                print_warn "DNS $dns response: ${DNS_TIME}ms (Moderate)"
            else
                print_fail "DNS $dns response: ${DNS_TIME}ms (Slow)"
            fi
        fi
    fi
done

#===============================================================================
# Section 6: Port & Service Status
#===============================================================================
print_header "6️⃣  LISTENING PORTS & SERVICES"

print_subheader "Listening Ports"
if cmd_exists ss; then
    run_cmd "TCP/UDP Listening Ports" "ss -tuln | head -30"
elif cmd_exists netstat; then
    run_cmd "TCP/UDP Listening Ports" "netstat -tuln | head -30"
fi

print_subheader "Established Connections"
if cmd_exists ss; then
    CONN_COUNT=$(ss -tun state established | wc -l)
    log_output "Active connections: $((CONN_COUNT - 1))"
    run_cmd "Established Connections (Top 15)" "ss -tun state established | head -15"
fi

#===============================================================================
# Section 7: Firewall Status
#===============================================================================
print_header "7️⃣  FIREWALL STATUS"

print_subheader "UFW Status"
if cmd_exists ufw; then
    UFW_STATUS=$(ufw status 2>/dev/null | head -1)
    log_output "UFW: $UFW_STATUS"
    if [[ "$UFW_STATUS" == *"active"* ]]; then
        run_cmd "UFW Rules" "ufw status numbered 2>/dev/null | head -20"
    fi
else
    print_info "UFW not installed"
fi

print_subheader "IPTables Rules Summary"
if cmd_exists iptables; then
    INPUT_RULES=$(iptables -L INPUT -n 2>/dev/null | wc -l)
    OUTPUT_RULES=$(iptables -L OUTPUT -n 2>/dev/null | wc -l)
    FORWARD_RULES=$(iptables -L FORWARD -n 2>/dev/null | wc -l)
    log_output "IPTables rules count - INPUT: $((INPUT_RULES-2)) | OUTPUT: $((OUTPUT_RULES-2)) | FORWARD: $((FORWARD_RULES-2))"
fi

#===============================================================================
# Section 8: Network Performance (Optional)
#===============================================================================
if [[ "$QUICK_MODE" != true ]]; then
    print_header "8️⃣  NETWORK PERFORMANCE"
    
    print_subheader "Latency Analysis"
    if [[ "$EXTERNAL_REACHABLE" -eq 1 ]]; then
        log_output "Running extended ping test to 8.8.8.8..."
        PING_RESULT=$(ping -c 10 -q 8.8.8.8 2>/dev/null)
        
        # Extract statistics
        PACKET_LOSS=$(echo "$PING_RESULT" | grep -oP '\d+(?=% packet loss)')
        RTT_LINE=$(echo "$PING_RESULT" | grep 'rtt\|round-trip')
        
        if [[ -n "$PACKET_LOSS" ]]; then
            if [[ "$PACKET_LOSS" -eq 0 ]]; then
                print_pass "Packet loss: ${PACKET_LOSS}%"
            elif [[ "$PACKET_LOSS" -lt 5 ]]; then
                print_warn "Packet loss: ${PACKET_LOSS}% (Minor)"
            else
                print_fail "Packet loss: ${PACKET_LOSS}% (Significant!)"
            fi
        fi
        
        if [[ -n "$RTT_LINE" ]]; then
            log_output "RTT Stats: $RTT_LINE"
        fi
    fi
    
    print_subheader "Traceroute to 8.8.8.8"
    if cmd_exists traceroute; then
        run_cmd "Traceroute" "traceroute -m 15 8.8.8.8 2>/dev/null || traceroute -m 15 -I 8.8.8.8 2>/dev/null"
    elif cmd_exists mtr; then
        run_cmd "MTR Report" "mtr -r -c 5 8.8.8.8"
    else
        print_info "traceroute/mtr not installed. Install with: apt install traceroute"
    fi
fi

#===============================================================================
# Section 9: Netplan Configuration (Ubuntu specific)
#===============================================================================
print_header "9️⃣  NETWORK CONFIGURATION FILES"

print_subheader "Netplan Configuration"
if [[ -d /etc/netplan ]]; then
    for file in /etc/netplan/*.yaml; do
        if [[ -f "$file" ]]; then
            run_cmd "Netplan: $file" "cat $file"
        fi
    done
else
    print_info "Netplan not found (may not be Ubuntu)"
fi

print_subheader "Cloud-Init Network Status"
if [[ -f /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg ]]; then
    print_info "Cloud-init network config is DISABLED"
    run_cmd "Cloud-init disable file" "cat /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg"
else
    print_info "Cloud-init network config is ENABLED (will override on reboot)"
fi

#===============================================================================
# Section 10: Summary & Recommendations
#===============================================================================
print_header "🔟  DIAGNOSTIC SUMMARY"

log_output "${BOLD}Test Results:${NC}"
log_output "─────────────────────────────────────────"

# Summarize key findings
ISSUES_FOUND=0

# Gateway check
if [[ -n "$DEFAULT_GW" ]]; then
    if test_ping "$DEFAULT_GW" 1; then
        log_output "${GREEN}✓${NC} Gateway connectivity:     OK"
    else
        log_output "${RED}✗${NC} Gateway connectivity:     FAILED"
        ((ISSUES_FOUND++))
    fi
else
    log_output "${RED}✗${NC} Gateway configuration:    MISSING"
    ((ISSUES_FOUND++))
fi

# External connectivity
if [[ "$EXTERNAL_REACHABLE" -eq 1 ]]; then
    log_output "${GREEN}✓${NC} Internet connectivity:    OK"
else
    log_output "${RED}✗${NC} Internet connectivity:    FAILED"
    ((ISSUES_FOUND++))
fi

# DNS
if [[ "$DNS_WORKING" -eq 1 ]]; then
    log_output "${GREEN}✓${NC} DNS resolution:           OK"
else
    log_output "${RED}✗${NC} DNS resolution:           FAILED"
    ((ISSUES_FOUND++))
fi

# Interface errors
TOTAL_ERRORS=0
for iface in $INTERFACES; do
    if [[ -d "/sys/class/net/$iface/statistics" ]]; then
        RX_ERRORS=$(cat /sys/class/net/$iface/statistics/rx_errors 2>/dev/null || echo 0)
        TX_ERRORS=$(cat /sys/class/net/$iface/statistics/tx_errors 2>/dev/null || echo 0)
        TOTAL_ERRORS=$((TOTAL_ERRORS + RX_ERRORS + TX_ERRORS))
    fi
done

if [[ "$TOTAL_ERRORS" -eq 0 ]]; then
    log_output "${GREEN}✓${NC} Interface errors:         NONE"
else
    log_output "${YELLOW}⚠${NC} Interface errors:         $TOTAL_ERRORS found"
fi

log_output ""
log_output "${BOLD}Overall Status:${NC}"
if [[ "$ISSUES_FOUND" -eq 0 ]]; then
    log_output "${GREEN}${BOLD}All network tests passed! ✓${NC}"
else
    log_output "${RED}${BOLD}$ISSUES_FOUND issue(s) detected. Review above for details.${NC}"
    
    log_output ""
    log_output "${BOLD}Troubleshooting Tips:${NC}"
    log_output "─────────────────────────────────────────"
    
    if [[ -z "$DEFAULT_GW" ]] || ! test_ping "$DEFAULT_GW" 1 2>/dev/null; then
        log_output "${YELLOW}→${NC} Check physical connection (cable/wifi)"
        log_output "${YELLOW}→${NC} Verify gateway IP in netplan config"
        log_output "${YELLOW}→${NC} Run: ip route add default via <gateway_ip>"
    fi
    
    if [[ "$EXTERNAL_REACHABLE" -eq 0 ]]; then
        log_output "${YELLOW}→${NC} Check if gateway can reach internet"
        log_output "${YELLOW}→${NC} Verify NAT/routing on router"
        log_output "${YELLOW}→${NC} Check for firewall blocking outbound traffic"
    fi
    
    if [[ "$DNS_WORKING" -eq 0 ]]; then
        log_output "${YELLOW}→${NC} Try: echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf"
        log_output "${YELLOW}→${NC} Check DNS server availability"
        log_output "${YELLOW}→${NC} Verify firewall allows UDP port 53"
    fi
fi

#===============================================================================
# Final Output
#===============================================================================
log_output ""
log_output "${BLUE}═══════════════════════════════════════════════════════════════════${NC}"
log_output "${CYAN}Diagnostic completed at $(date)${NC}"

if [[ "$SAVE_LOG" == true ]]; then
    log_output "${GREEN}Results saved to: $LOG_FILE${NC}"
    log_output "${YELLOW}To view: cat $LOG_FILE${NC}"
    log_output "${YELLOW}To share: cat $LOG_FILE | nc termbin.com 9999${NC}"
fi

log_output "${BLUE}═══════════════════════════════════════════════════════════════════${NC}"
