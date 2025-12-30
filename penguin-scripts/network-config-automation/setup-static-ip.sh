#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_header() {
    echo -e "\n${BLUE}════════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    print_error "This script must be run as root (use sudo)"
    exit 1
fi

print_header "Ubuntu Static IP Configuration Script"

#===============================================================================
# STEP 1: Detect Network Interface
#===============================================================================
print_info "Detecting network interface..."

# Get the default interface (the one with default route)
DEFAULT_INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n1)

if [[ -z "$DEFAULT_INTERFACE" ]]; then
    print_error "Could not detect network interface automatically."
    read -p "Enter your network interface name (e.g., ens3, eth0): " DEFAULT_INTERFACE
fi

# Get current IP, gateway, and MAC address
CURRENT_IP=$(ip -4 addr show "$DEFAULT_INTERFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
CURRENT_CIDR=$(ip -4 addr show "$DEFAULT_INTERFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+')
CURRENT_GATEWAY=$(ip route | grep default | awk '{print $3}' | head -n1)
CURRENT_MAC=$(ip link show "$DEFAULT_INTERFACE" | grep -oP '(?<=link/ether\s)[a-f0-9:]+')
CURRENT_MTU=$(ip link show "$DEFAULT_INTERFACE" | grep -oP '(?<=mtu\s)\d+')

echo ""
print_success "Detected Interface: $DEFAULT_INTERFACE"
print_success "Current IP: $CURRENT_CIDR"
print_success "Current Gateway: $CURRENT_GATEWAY"
print_success "MAC Address: $CURRENT_MAC"
print_success "MTU: $CURRENT_MTU"

#===============================================================================
# STEP 2: Get User Input
#===============================================================================
print_header "Enter Network Configuration"

# Static IP Address
echo -e "${YELLOW}Enter the static IP address with CIDR notation${NC}"
echo -e "${CYAN}Example: 192.168.95.215/24${NC}"
read -p "Static IP [$CURRENT_CIDR]: " STATIC_IP
STATIC_IP=${STATIC_IP:-$CURRENT_CIDR}

# Validate IP format
if ! [[ $STATIC_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]]; then
    print_error "Invalid IP format. Please use format: x.x.x.x/xx"
    exit 1
fi

# Gateway
echo ""
echo -e "${YELLOW}Enter the gateway address${NC}"
echo -e "${CYAN}Example: 192.168.95.1${NC}"
read -p "Gateway [$CURRENT_GATEWAY]: " GATEWAY
GATEWAY=${GATEWAY:-$CURRENT_GATEWAY}

# DNS Server
echo ""
echo -e "${YELLOW}Enter DNS server(s) - separate multiple with comma${NC}"
echo -e "${CYAN}Example: 8.8.8.8 or 8.8.8.8,8.8.4.4${NC}"
read -p "DNS Server [8.8.8.8]: " DNS_SERVERS
DNS_SERVERS=${DNS_SERVERS:-"8.8.8.8"}

# MTU (optional)
echo ""
echo -e "${YELLOW}Enter MTU value (press Enter to keep current)${NC}"
read -p "MTU [$CURRENT_MTU]: " MTU
MTU=${MTU:-$CURRENT_MTU}

#===============================================================================
# STEP 3: Display Configuration Summary
#===============================================================================
print_header "Configuration Summary"

echo -e "  Interface:    ${GREEN}$DEFAULT_INTERFACE${NC}"
echo -e "  Static IP:    ${GREEN}$STATIC_IP${NC}"
echo -e "  Gateway:      ${GREEN}$GATEWAY${NC}"
echo -e "  DNS:          ${GREEN}$DNS_SERVERS${NC}"
echo -e "  MAC Address:  ${GREEN}$CURRENT_MAC${NC}"
echo -e "  MTU:          ${GREEN}$MTU${NC}"

echo ""
read -p "Do you want to proceed with this configuration? (y/n): " CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    print_warning "Configuration cancelled by user."
    exit 0
fi

#===============================================================================
# STEP 4: Disable Cloud-Init Network Configuration
#===============================================================================
print_header "Step 1: Disabling Cloud-Init Network Config"

CLOUD_INIT_FILE="/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg"

# Create directory if it doesn't exist
mkdir -p /etc/cloud/cloud.cfg.d/

# Write the disable config
cat > "$CLOUD_INIT_FILE" << 'EOF'
network: {config: disabled}
EOF

if [[ -f "$CLOUD_INIT_FILE" ]]; then
    print_success "Created: $CLOUD_INIT_FILE"
    echo ""
    echo -e "${CYAN}Contents:${NC}"
    cat "$CLOUD_INIT_FILE"
else
    print_error "Failed to create cloud-init config file"
    exit 1
fi

#===============================================================================
# STEP 5: Backup Existing Netplan Config
#===============================================================================
print_header "Step 2: Backing Up Existing Netplan Config"

NETPLAN_FILE="/etc/netplan/50-cloud-init.yaml"
BACKUP_FILE="/etc/netplan/50-cloud-init.yaml.backup.$(date +%Y%m%d_%H%M%S)"

# Find existing netplan file
if [[ ! -f "$NETPLAN_FILE" ]]; then
    # Try to find any netplan config
    NETPLAN_FILE=$(ls /etc/netplan/*.yaml 2>/dev/null | head -n1)
    if [[ -z "$NETPLAN_FILE" ]]; then
        NETPLAN_FILE="/etc/netplan/01-netcfg.yaml"
        print_warning "No existing netplan file found. Creating new one: $NETPLAN_FILE"
    fi
fi

if [[ -f "$NETPLAN_FILE" ]]; then
    cp "$NETPLAN_FILE" "$BACKUP_FILE"
    print_success "Backup created: $BACKUP_FILE"
    echo ""
    echo -e "${CYAN}Original configuration:${NC}"
    cat "$NETPLAN_FILE"
fi

#===============================================================================
# STEP 6: Generate New Netplan Configuration
#===============================================================================
print_header "Step 3: Creating New Netplan Configuration"

# Process DNS servers (convert comma-separated to YAML list)
DNS_YAML=""
IFS=',' read -ra DNS_ARRAY <<< "$DNS_SERVERS"
for dns in "${DNS_ARRAY[@]}"; do
    dns=$(echo "$dns" | xargs)  # Trim whitespace
    DNS_YAML="$DNS_YAML                  - $dns\n"
done

# Create the netplan configuration
cat > "$NETPLAN_FILE" << EOF
# Static IP configuration
# Generated by setup-static-ip.sh on $(date)
# Backup saved to: $BACKUP_FILE

network:
    version: 2
    ethernets:
        $DEFAULT_INTERFACE:
            dhcp4: no
            addresses:
              - $STATIC_IP
            routes:
              - to: default
                via: $GATEWAY
            nameservers:
                addresses:
$(echo -e "$DNS_YAML" | sed '/^$/d')
            match:
                macaddress: $CURRENT_MAC
            mtu: $MTU
            set-name: $DEFAULT_INTERFACE
EOF

print_success "Created new netplan configuration"
echo ""
echo -e "${CYAN}New configuration:${NC}"
echo -e "${BLUE}────────────────────────────────────────${NC}"
cat "$NETPLAN_FILE"
echo -e "${BLUE}────────────────────────────────────────${NC}"

#===============================================================================
# STEP 7: Validate and Apply Configuration
#===============================================================================
print_header "Step 4: Validating Configuration"

# Run netplan generate to check for errors
echo -e "${CYAN}Running: netplan generate${NC}"
echo ""

GENERATE_OUTPUT=$(netplan generate 2>&1)
GENERATE_STATUS=$?

if [[ $GENERATE_STATUS -eq 0 ]]; then
    print_success "Netplan configuration is valid!"
    if [[ -n "$GENERATE_OUTPUT" ]]; then
        echo -e "${YELLOW}Output:${NC}"
        echo "$GENERATE_OUTPUT"
    fi
else
    print_error "Netplan configuration has errors:"
    echo "$GENERATE_OUTPUT"
    echo ""
    print_warning "Restoring backup configuration..."
    cp "$BACKUP_FILE" "$NETPLAN_FILE"
    exit 1
fi

#===============================================================================
# STEP 8: Apply Configuration
#===============================================================================
print_header "Step 5: Applying Configuration"

echo -e "${CYAN}Running: netplan apply${NC}"
echo ""

APPLY_OUTPUT=$(netplan apply 2>&1)
APPLY_STATUS=$?

if [[ -n "$APPLY_OUTPUT" ]]; then
    # Filter out the OVS warning as it's harmless
    if [[ "$APPLY_OUTPUT" == *"Cannot call Open vSwitch"* ]]; then
        print_warning "Open vSwitch warning (can be ignored):"
        echo "$APPLY_OUTPUT"
    else
        echo "$APPLY_OUTPUT"
    fi
fi

print_success "Netplan configuration applied!"

#===============================================================================
# STEP 9: Show Results
#===============================================================================
print_header "Step 6: Verifying New Configuration"

echo -e "${CYAN}Running: networkctl status $DEFAULT_INTERFACE${NC}"
echo ""

networkctl status "$DEFAULT_INTERFACE"

echo ""
print_header "Configuration Complete!"

echo -e "  ${GREEN}✓${NC} Cloud-init network config disabled"
echo -e "  ${GREEN}✓${NC} Netplan configuration updated"
echo -e "  ${GREEN}✓${NC} Static IP applied: ${GREEN}$STATIC_IP${NC}"
echo -e "  ${GREEN}✓${NC} Gateway: ${GREEN}$GATEWAY${NC}"
echo -e "  ${GREEN}✓${NC} DNS: ${GREEN}$DNS_SERVERS${NC}"
echo ""
echo -e "${CYAN}Backup location: $BACKUP_FILE${NC}"
echo -e "${YELLOW}To restore original config: sudo cp $BACKUP_FILE $NETPLAN_FILE && sudo netplan apply${NC}"
echo ""
