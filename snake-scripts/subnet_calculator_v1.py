#!/usr/bin/env python3
import ipaddress

def main():
    print("Subnet Calculator CLI")
    network_input = input("Enter network in CIDR format (e.g., 192.168.10.0/24): ").strip()

    try:
        network = ipaddress.ip_network(network_input, strict=False)
    except ValueError as e:
        print(f"Error: {e}")
        return

    print("\n=== Subnet Details ===")
    print(f"Network: {network.network_address}")
    print(f"Broadcast: {network.broadcast_address}")
    print(f"Subnet Mask: {network.netmask}")
    print(f"Prefix Length: /{network.prefixlen}")
    print(f"Number of Addresses: {network.num_addresses}")
    
    usable_hosts = list(network.hosts())
    print(f"Number of Usable Hosts: {len(usable_hosts)}")
    if usable_hosts:
        print(f"First Usable IP: {usable_hosts[0]}")
        print(f"Last Usable IP: {usable_hosts[-1]}")

    print("\nAll Usable IPs:")
    for ip in usable_hosts:
        print(ip)

if __name__ == "__main__":
    main()
