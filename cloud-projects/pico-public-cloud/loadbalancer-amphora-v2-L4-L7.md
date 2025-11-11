&nbsp;                     ┌────────────────────────────┐

&nbsp;                     │      External Internet     │

&nbsp;                     └────────────┬───────────────┘

&nbsp;                                  │

&nbsp;                                  ▼

&nbsp;                    ┌────────────────────────────┐

&nbsp;                    │   Floating IP (Elastic IP) │

&nbsp;                    │   160.191.150.136          │

&nbsp;                    └────────────┬───────────────┘

&nbsp;                                 │

&nbsp;                                 ▼

&nbsp;                    ┌────────────────────────────┐

&nbsp;                    │ Load Balancer: AmphoraV2   │

&nbsp;                    │ Name: load-balancer-test   │

&nbsp;                    │ Subnet: net-1              │

&nbsp;                    └────────────┬───────────────┘

&nbsp;                                 │

&nbsp;             ┌───────────────────┼───────────────────┐

&nbsp;             │                                       │

&nbsp;   ┌─────────▼────────┐                  ┌───────────▼─────────┐

&nbsp;   │ Listener: lis-ssh│                  │ Listener: lis-http  │

&nbsp;   │ Protocol: TCP/22 │                  │ Protocol: HTTP/80   │

&nbsp;   └─────────┬────────┘                  └───────────┬─────────┘

&nbsp;             │                                       │

&nbsp;   ┌─────────▼────────┐                  ┌───────────▼─────────┐

&nbsp;   │ Pool: pool-ssh   │                  │ Pool: pool-http     │

&nbsp;   │ Algorithm: RR    │                  │ Algorithm: RR       │

&nbsp;   └─────────┬────────┘                  └───────────┬─────────┘

&nbsp;             │                                       │

&nbsp; ┌───────────▼────────────┐              ┌───────────▼────────────┐

&nbsp; │ Member: vm-1           │              │ Member: vm-1           │

&nbsp; │ IP: 192.168.10.x       │              │ IP: 192.168.10.x       │

&nbsp; └───────────┬────────────┘              └───────────┬────────────┘

&nbsp;             │                                       │

&nbsp; ┌───────────▼────────────┐              ┌───────────▼────────────┐

&nbsp; │ Member: vm-2           │              │ Member: vm-2           │

&nbsp; │ IP: 192.168.10.x       │              │ IP: 192.168.10.x       │

&nbsp; └────────────────────────┘              └────────────────────────┘

&nbsp;                ▲                                   ▲

&nbsp;                │                                   │

&nbsp;         ┌──────┴────────┐                  ┌───────┴───────┐

&nbsp;         │ Instance: vm-1│                  │ Instance: vm-2│

&nbsp;         │ OS: Ubuntu    │                  │ OS: Ubuntu    │

&nbsp;         │ nginx + HTML  │                  │ nginx + HTML  │

&nbsp;         └───────────────┘                  └───────────────┘

&nbsp;                ▲                                   ▲

&nbsp;                │                                   │

&nbsp;       ┌────────┴───────────────────────────────────┴────────┐

&nbsp;       │                    Network: net-1                   │

&nbsp;       │              Subnet: 192.168.10.0/24                │

&nbsp;       │              Gateway: 192.168.10.1                  │

&nbsp;       │              DNS: 8.8.8.8                           │

&nbsp;       └────────┬────────────────────────────────┬───────────┘

&nbsp;                │                                │

&nbsp;                ▼                                ▼

&nbsp;     ┌────────────────────┐          ┌────────────────────────┐

&nbsp;     │  Router: router    │──────────│  External Net: public- │

&nbsp;     │  SNAT: Enabled     │          │  fir-pool-01           │

&nbsp;     │  Interface IP:     │          └────────────────────────┘

&nbsp;     │  192.168.10.1      │

&nbsp;     └────────────────────┘







# **Step-by-Step Explanation**

##### 

##### 1\. Login \& Accessing Compute

\- Logged into Pico Cloud.

\- Navigated to Compute → Instances.

\- Goal: **Launch Ubuntu-based VMs for testing.**



##### 2\. Network Configuration

\- Network Name: net-1

\- Subnet: 192.168.10.0/24

\- Gateway: Enabled (default gateway becomes 192.168.10.1)

\- DNS:8.8.8.8 (Google Public DNS)

\- DHCP Pool Range:192.168.10.2 - 192.168.10.254 (IPs available for VMs)



*> Purpose: To define an internal private network where all VMs can communicate.*



##### 3\. Router Configuration

\- Router Name: router

\- SNAT Enabled: Yes 

\- External Network:public-fir-pool-01

> SNAT (Source NAT) enables internal VMs to reach the internet using the router’s public IP.

\- Added internal interface to **router** using **net-1**

&nbsp;   - Interface IP becomes 192.168.10.1



> *This connects the private subnet to the router, so internal VMs can route via it.*



##### 4\. VM Creation

Created two identical VMs:

\- Name: vm-1, vm-2

\- Image: Ubuntu 18.04

\- Specs: 1 vCPU, 2GB RAM

\- Network: net-1

\- Keypair: Created to allow SSH access

\- Security Group: sec-1

&nbsp;   - Allowed:

&nbsp;       - TCP 22 (SSH)

&nbsp;       - TCP 80 (HTTP)

&nbsp;       - TCP 443 (HTTPS)

&nbsp;       - ICMP (Ping)

&nbsp;       - All ingress (default)



> *Security group controls which ports are accessible from external/internal sources.*



##### 5\. Floating IP Allocation

\- Allocated IP: 160.191.150.136

\- **Used later to map public access to the Load Balancer**.



##### 6\. Load Balancer Setup (AmphoraV2)

\- Type Chosen: AmphoraV2 (supports both Layer 4 and Layer 7)

\- Name: load-balancer-test

\- Subnet: net-1

\- Admin State: Enabled



> *This is the core component that distributes traffic across VM instances.*



##### 7\. Listener Creation

\- Created 2 Listeners:

&nbsp;   - ***lis-ssh***: TCP on port 22

&nbsp;   - ***lis-http***: HTTP on port 80



> Listeners are the **entry points** to the load balancer for specific ports and protocols.



##### 8\. Attach Floating IP

\- Attached 160.191.150.136 to the Load Balancer.



> This allows external users to reach the load balancer using this public IP.



##### 9\. Pool Configuration

\- Created 2 Pools:

&nbsp;   - **pool-ssh**: Protocol TCP, Algorithm: Round Robin

&nbsp;   - **pool-http**: Protocol HTTP, Algorithm: Round Robin

&nbsp;   - **Session Persistence**: None (no sticky sessions)

> 🔍 Pools define how traffic is distributed and to which backend members.



##### 10\. Pool Members (VMs)

\- Added **vm-1** and **vm-2** to both pools with their private IPs (192.168.10.x)

\- These members now serve SSH and HTTP traffic depending on the listener.



##### 11\. Function Testing

\- SSH Test:

&nbsp;   - SSH into the floating IP multiple times.

&nbsp;   - First logged into vm-2, then vm-1, verifying L4 load balancing.

\- HTTP Test:

&nbsp;   - Installed nginx on both VMs.

&nbsp;   - Custom HTML page: "**Hello from vm-1**" / "**Hello from vm-2**"

&nbsp;   - Opened the same IP in two tabs, got different responses → verified L7 load balancing



