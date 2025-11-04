#!/usr/bin/env python3
import ipaddress
import pandas as pd
import os

def get_network_input():
    """Continuously ask for network input until valid CIDR is entered"""
    while True:
        user_input = input("Enter network in CIDR format (e.g., 192.168.10.0/24): ").strip()
        try:
            network = ipaddress.ip_network(user_input, strict=False)
            return network
        except ValueError:
            print("\n❌ Invalid format! Please input in correct CIDR structure like:")
            print("👉 Example: 192.168.10.0/24 or 10.10.10.0/30\n")

def calculate_details(network):
    """Generate subnet details and usable IPs"""
    usable_hosts = list(network.hosts())
    details = {
        "Network": str(network.network_address),
        "Broadcast": str(network.broadcast_address),
        "Subnet Mask": str(network.netmask),
        "Prefix Length": f"/{network.prefixlen}",
        "Number of Addresses": network.num_addresses,
        "Number of Usable Hosts": len(usable_hosts),
        "First Usable IP": str(usable_hosts[0]) if usable_hosts else "N/A",
        "Last Usable IP": str(usable_hosts[-1]) if usable_hosts else "N/A",
        "Default Gateway Suggestion": str(usable_hosts[0]) if len(usable_hosts) > 0 else "N/A"
    }
    return details, usable_hosts

def show_details(details, usable_hosts):
    """Print subnet details neatly"""
    print("\n=== Subnet Details ===")
    print(f"Network: {details['Network']}")
    print(f"Broadcast: {details['Broadcast']}")
    print(f"Subnet Mask: {details['Subnet Mask']}")
    print(f"Prefix Length: {details['Prefix Length']}")
    print(f"Number of Addresses: {details['Number of Addresses']}")
    print(f"Number of Usable Hosts: {details['Number of Usable Hosts']}")
    print(f"First Usable IP: {details['First Usable IP']}")
    print(f"Last Usable IP: {details['Last Usable IP']}")
    print(f"Default Gateway Suggestion: {details['Default Gateway Suggestion']}")
    print("\nCIDR notation breakdown")
    print("-----------------------------")
    print(f"Network ID: {details['Network']}")
    print(f"Subnet Mask: {details['Subnet Mask']}")
    print(f"Prefix Length: {details['Prefix Length']}")
    print("-----------------------------")
    print(f"\nAll Usable IPs (total {details['Number of Usable Hosts']}):")
    for ip in usable_hosts:
        print(ip)

def save_to_excel(details, usable_hosts):
    """Save subnet details to Excel if user chooses"""
    choice = input("\nDo you want to save the usable IPs and details to an Excel file? (y/n): ").strip().lower()
    if choice != 'y':
        print("\nThank you for using the Subnet Calculator! 😊")
        return

    save_path = input("Enter the directory path where the file should be saved (or press Enter for current folder): ").strip()
    if not save_path:
        save_path = os.getcwd()

    os.makedirs(save_path, exist_ok=True)
    file_path = os.path.join(save_path, "subnet_details.xlsx")

    # Prepare DataFrame
    df = pd.DataFrame({
        "Usable IPs": usable_hosts
    })
    summary = pd.DataFrame({
        "Parameter": list(details.keys()),
        "Value": list(details.values())
    })

    # Write to Excel with two sheets
    with pd.ExcelWriter(file_path, engine='openpyxl') as writer:
        summary.to_excel(writer, index=False, sheet_name="Subnet Details")
        df.to_excel(writer, index=False, sheet_name="Usable IPs")

    print(f"\n✅ File saved successfully at: {file_path}")

def main():
    print("📘 Welcome to the Subnet Calculator CLI")
    network = get_network_input()
    details, usable_hosts = calculate_details(network)
    show_details(details, usable_hosts)
    save_to_excel(details, usable_hosts)

if __name__ == "__main__":
    main()
