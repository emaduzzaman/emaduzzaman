#!/usr/bin/env python3
"""
VLSM Subnet Planner (IPv4)

Features:
- Accepts a base network in CIDR format (e.g., 10.0.0.0/16).
- Accepts a list of required hosts per subnet (comma-separated or one-per-line).
- Performs VLSM (largest-first) allocation.
- Prints subnet details: network, broadcast, netmask, prefix, total addresses,
  usable hosts count, first/last usable, default gateway suggestion, and list of usable IPs.
- Optionally exports results to an Excel file (two sheets: summary + usable IPs).

Dependencies:
  pip install pandas openpyxl
"""
import ipaddress
import math
import os
import sys
from datetime import datetime

try:
    import pandas as pd
except Exception:
    pd = None

def parse_network_input():
    while True:
        user_input = input("Enter base network in CIDR format (e.g., 10.0.0.0/16): ").strip()
        try:
            net = ipaddress.ip_network(user_input, strict=False)
            if net.version != 4:
                print("Only IPv4 is supported. Please enter an IPv4 network.")
                continue
            return net
        except ValueError:
            print("Invalid CIDR structure. Please input in correct format like 10.0.0.0/16.")

def parse_required_hosts():
    print("\nEnter required hosts per subnet.")
    print("You can enter them in one line separated by commas (e.g. 200,50,10)")
    print("or enter one per line and press Enter on an empty line to finish.")
    line = input("-> ").strip()
    if ',' in line:
        parts = [p.strip() for p in line.split(',') if p.strip()]
    elif line == "":
        print("No input entered. Please enter at least one required hosts value.")
        return parse_required_hosts()
    else:
        parts = [line]
        while True:
            nxt = input("-> ").strip()
            if nxt == "":
                break
            parts.append(nxt)

    reqs = []
    for p in parts:
        try:
            n = int(p)
            if n < 1:
                print(f"Minimum 1 host required for each subnet. Ignoring invalid value: {p}")
                continue
            reqs.append(n)
        except ValueError:
            print(f"Ignoring invalid number: {p}")
    if not reqs:
        print("No valid host requirements provided. Try again.")
        return parse_required_hosts()
    return reqs

def prefix_for_hosts(hosts):
    """
    Given required usable hosts, return smallest prefix length that can fit them.
    usable hosts = addresses - 2 (network + broadcast), except for /31 & /32 which are special (not used here).
    """
    needed_addresses = hosts + 2  # network + broadcast
    for prefix in range(32, 0, -1):
        size = 2 ** (32 - prefix)
        if size >= needed_addresses:
            return prefix
    return None

def smallest_prefix_for_addresses(addresses):
    # not used directly, but helper
    for prefix in range(32, 0, -1):
        if 2 ** (32 - prefix) >= addresses:
            return prefix
    return None

def allocate_vlsm(base_network, required_hosts_list):
    # Sort descending (largest first)
    req_sorted = sorted(required_hosts_list, reverse=True)
    # Free block list: tuples of ip_network
    free_blocks = [base_network]
    allocations = []

    for hosts in req_sorted:
        prefix = prefix_for_hosts(hosts)
        block_found = None
        for i, block in enumerate(free_blocks):
            if block.num_addresses >= (2 ** (32 - prefix)):
                block_found = (i, block)
                break
        if block_found is None:
            # cannot allocate
            allocations.append({
                "required_hosts": hosts,
                "allocated": False,
                "reason": "Insufficient space in base network"
            })
            continue

        idx, block = block_found
        # split block into subnets of desired prefix
        subnets = list(block.subnets(new_prefix=prefix))
        allocated_subnet = subnets[0]
        # create remainder blocks: combine the rest of subnets (from index 1..end)
        remainder = subnets[1:]
        # replace the chosen free block with remainder blocks
        del free_blocks[idx]
        # Insert remainders back to free_blocks while keeping sorted by network address
        for r in remainder:
            free_blocks.append(r)
        # Also keep other existing free blocks
        # Normalize free blocks order by network address
        free_blocks = sorted(free_blocks, key=lambda x: int(x.network_address))

        # prepare allocation details
        usable_hosts = list(allocated_subnet.hosts())
        allocation = {
            "required_hosts": hosts,
            "allocated": True,
            "network": allocated_subnet.network_address,
            "prefixlen": allocated_subnet.prefixlen,
            "netmask": allocated_subnet.netmask,
            "broadcast": allocated_subnet.broadcast_address,
            "total_addresses": allocated_subnet.num_addresses,
            "usable_count": len(usable_hosts),
            "first_usable": str(usable_hosts[0]) if usable_hosts else "N/A",
            "last_usable": str(usable_hosts[-1]) if usable_hosts else "N/A",
            "default_gateway_suggestion": str(usable_hosts[0]) if usable_hosts else "N/A",
            "usable_list": [str(ip) for ip in usable_hosts]
        }
        allocations.append(allocation)

    # After allocations, sort allocations by network address (for neat output)
    allocations_alloc = [a for a in allocations if a.get("allocated")]
    allocations_unalloc = [a for a in allocations if not a.get("allocated")]
    allocations_alloc = sorted(allocations_alloc, key=lambda x: int(ipaddress.ip_address(x["network"])))
    result = allocations_alloc + allocations_unalloc
    return result

def pretty_print_allocations(base_network, allocations):
    print("\n=== Allocation Results ===")
    print(f"Base network: {base_network.with_prefixlen}")
    print("")

    for i, a in enumerate(allocations, start=1):
        if not a.get("allocated"):
            print(f"[{i}] Required hosts: {a['required_hosts']:<5} -> NOT ALLOCATED: {a.get('reason')}")
            continue
        print(f"[{i}] Required hosts: {a['required_hosts']}")
        print(f"    Network: {a['network']}/{a['prefixlen']}")
        print(f"    Broadcast: {a['broadcast']}")
        print(f"    Subnet Mask: {a['netmask']}")
        print(f"    Prefix Length: /{a['prefixlen']}")
        print(f"    Number of Addresses: {a['total_addresses']}")
        print(f"    Number of Usable Hosts: {a['usable_count']}")
        print(f"    First Usable IP: {a['first_usable']}")
        print(f"    Last Usable IP: {a['last_usable']}")
        print(f"    Default Gateway Suggestion: {a['default_gateway_suggestion']}")
        print("    All Usable IPs (total {}):".format(a['usable_count']))
        for ip in a['usable_list']:
            print(f"      {ip}")
        print("")

def save_to_excel_prompt(base_network, allocations):
    if pd is None:
        print("pandas not installed; Excel export not available. Install pandas and openpyxl to enable this.")
        return
    choice = input("Do you want to save allocations to an Excel file? (y/n): ").strip().lower()
    if choice != 'y':
        print("\nThank you!")
        return
    path = input("Enter directory path to save the file (press Enter for current folder): ").strip()
    if not path:
        path = os.getcwd()
    os.makedirs(path, exist_ok=True)
    filename = f"vlsm_allocations_{base_network.network_address}_{base_network.prefixlen}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    filepath = os.path.join(path, filename)

    # Build summary and IP sheets
    summary_rows = []
    ip_rows = []
    for a in allocations:
        if not a.get("allocated"):
            summary_rows.append({
                "Required Hosts": a["required_hosts"],
                "Allocated": "No",
                "Reason": a.get("reason", "")
            })
            continue
        summary_rows.append({
            "Required Hosts": a["required_hosts"],
            "Allocated": "Yes",
            "Network": f"{a['network']}/{a['prefixlen']}",
            "Netmask": str(a['netmask']),
            "Broadcast": str(a['broadcast']),
            "Total Addresses": a['total_addresses'],
            "Usable Count": a['usable_count'],
            "First Usable": a['first_usable'],
            "Last Usable": a['last_usable'],
            "Default Gateway Suggestion": a['default_gateway_suggestion']
        })
        for ip in a['usable_list']:
            ip_rows.append({
                "Parent Network": f"{a['network']}/{a['prefixlen']}",
                "Usable IP": ip
            })

    df_summary = pd.DataFrame(summary_rows)
    df_ips = pd.DataFrame(ip_rows)

    with pd.ExcelWriter(filepath, engine="openpyxl") as writer:
        df_summary.to_excel(writer, index=False, sheet_name="Summary")
        df_ips.to_excel(writer, index=False, sheet_name="Usable_IPs")

    print(f"\n✅ Excel saved at: {filepath}")

def main():
    print("📘 VLSM Subnet Planner CLI")
    base_network = parse_network_input()
    required_hosts = parse_required_hosts()
    print("\nCalculating allocations (largest-first)...\n")
    allocations = allocate_vlsm(base_network, required_hosts)
    pretty_print_allocations(base_network, allocations)
    save_to_excel_prompt(base_network, allocations)

if __name__ == "__main__":
    main()



#Notes & suggestions
#The script uses strict=False for parsing the base network, so 10.0.0.5/24 is accepted and normalized to 10.0.0.0/24.
#It does not attempt to "pack" multiple small requested subnets into a non-first portion of a free block in an advanced packing sense beyond first-fit; it performs standard VLSM largest-first allocation which is typical and predictable for network design.
#If some requested subnets cannot be allocated due to insufficient total address space, they will be flagged as NOT ALLOCATED.
#For huge host lists (many subnets), Excel export might be large — consider CSV or database output for very large data */