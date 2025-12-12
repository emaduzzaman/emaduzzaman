# Hi, I'm Kazi Emaduzzaman Gelani

I am a Computer Science graduate and currently part of the Technology and Operations team at PICO Public Cloud, a division of Fiber@home Global Limited. My work focuses on cloud infrastructure, networking, system operations, Linux, and automation.

Before this role, I worked as a Solution Engineer at Huawei Technologies Bangladesh Ltd. in the South Asia Data Center Sales and Solution team, where I gained experience with Huawei server and storage products. I started my career as an intern at Banglalink Digital Communications in the Digital Business division.

I have completed CCNA and AWS Solutions Architect training, and I work extensively with Linux systems and cloud environments. RHCSA is also part of my skill set. This repository organizes my projects, labs, configurations, and scripting tools that support my daily engineering work and continuous learning.

LinkedIn: [https://www.linkedin.com/in/emaduzzaman](https://www.linkedin.com/in/emaduzzaman)
Credly: [https://www.credly.com/users/kazi-emaduzzaman-gelani](https://www.credly.com/users/kazi-emaduzzaman-gelani)

---

# Repository Structure

This repository contains the tools, configurations, labs, and projects that I work on regularly.
The complete folder tree is available here: [Jump to Full Repository Tree](#full-repository-tree)

### 1. penguin-scripts

Shell scripts for Linux distributions, including automation tools and day-to-day system management helpers.

### 2. full-projects

Complete end-to-end solutions, such as DNS, web servers, mail servers, multi-service setups, and environment-wide deployments.

### 3. penguin-system_configuration

Linux OS configuration files, system-level adjustments, service configurations, and platform-specific settings.

### 4. snake-scripts

Python scripts used for automation, operational tooling, utilities, and network/IP calculations.

### 5. wincore-systems

Documentation and configurations for Windows systems, including troubleshooting, registry changes, and operational guidelines.

### 6. networking-labs

Hands-on networking labs for practice and research. Includes CCNA labs, routing, switching, BGP, DNS, load balancing, VPNs, and protocol testing.

### 7. wincore-scripts

PowerShell and batch scripts for Windows automation and administrative workflows.

### 8. cloud-engine

Cloud-related assets including cloud-init templates, VM image workflows, automation scripts, and cloud platform lab work.

---

# Purpose of This Repository

This repository serves as a structured knowledge base for my professional work and technical research. It includes:

* Notes and configurations from real infrastructure environments
* Reusable system and network configurations
* Labs and experiments for focused learning
* Scripts and tools that support daily tasks
* Complete documented projects and cloud setups

---
# Full Repository Tree

```
emaduzzaman/
├── cloud-engine/
│   ├── cloud-init/
│   │   ├── cloud-image/
│   │   │   ├── meta-data
│   │   │   ├── seed.iso
│   │   │   └── user-data
│   │   └── userdata-scripts/
│   │       ├── default-user-pass-ssh-enable.yaml
│   │       └── user-creation-bond-cloud-init.yaml
│   └── home-lab/
│       ├── Screenshot 2025-12-12 at 3.18.14 PM.png
│       ├── Screenshot 2025-12-12 at 3.19.05 PM.png
│       ├── Screenshot 2025-12-12 at 3.19.16 PM.png
│       └── cli-proxmox-cloud-image.txt
├── full-projects/
│   └── dns_web-applicaiton_mail_server_openstack-environment/
│       └── test_result-screenshot/
│           ├── pc-1, ss1.png
│           ├── pc-1, ss2.png
│           └── pc-1checking-from-client-windows-10_host.png
├── networking-labs/
│   ├── ccna-200-301/
│   │   ├── ACL.txt
│   │   ├── ACL324.pkt
│   │   ├── Configure Dynamic NAT.txt
│   │   ├── Configuring DHCPv4.txt
│   │   ├── Configuring Switchport Security.txt
│   │   ├── Configuring VLAN, VTP, Inter-VLAN Routing.txt
│   │   ├── DHCP-configuraiton-notev6.txt
│   │   ├── Ipsec.txt
│   │   ├── SM_Solution.txt
│   │   ├── VLSM Assignment.txt
│   │   ├── VLSM Example.docx
│   │   ├── VLSM.png
│   │   ├── XYZ Company.txt
│   │   ├── basic-router-configuraiton.pkt
│   │   ├── basic-router-configuration-commands.txt
│   │   ├── dhcpv4.pkt
│   │   ├── dhcpv6.pkt
│   │   ├── hsrp.pkt
│   │   ├── ip_addressing.png
│   │   ├── ipv6.png
│   │   ├── ipv6_address_assignment.pdf
│   │   ├── ipv6_is_easy.pdf
│   │   ├── module-exam/
│   │   │   ├── CCNA3-Skill-Exam-Question.txt
│   │   │   ├── Module-1_ITN-exam-solution.pka
│   │   │   ├── Module-2_SRWE-exam-solution .pka
│   │   │   ├── ccna3.pkt
│   │   │   └── ccna3_kazi-emaduzzaman-gelani.pkt
│   │   ├── nat.pkt
│   │   ├── ospf.pkt
│   │   ├── ospf_commands.txt
│   │   ├── sm.pka
│   │   ├── srwe_answer.pdf
│   │   ├── vlan-svi.pkt
│   │   ├── vlan.pkt
│   │   ├── vlsm_practice.doc
│   │   ├── vlsm_practice_2.doc
│   │   ├── vpn.pkt
│   │   └── wlan.pkt
│   ├── dns/
│   ├── full-projects/
│   │   └── Compleated-Project/
│   │       └── dns_web-applicaiton_mail_server_pico-environment/
│   ├── load-balancer/
│   │   └── Load-Balancing-on-openstack-AmphoraV2/
│   │       └── load-balancer-at_layer_7.jpg
│   └── vpn/
│       ├── packet-tracer-ipsec-topology-config/
│       │   └── vpn.pkt
│       └── wireguard-vpn-gateway-openstack/
│           ├── configuraiton-files/
│           └── snaps-vm_creation/
│               ├── netework_creation - 2.png
│               ├── netework_creation-3.png
│               ├── network_creation-1.png
│               ├── server-configuration.png
│               └── vm-creation -1.png
├── penguin-scripts/
│   ├── firewall_iptable.sh
│   ├── installed_apts.sh
│   ├── linux-sys-info.sh
│   ├── network_diagnose.sh
│   ├── remove-known-hosts.sh
│   ├── repo_cleanup.sh
│   ├── system-cleaning/
│   │   ├── clean_xrdp_xfce.sh
│   │   └── remove-bind9.sh
│   ├── system_monitor.sh
│   ├── user-management/
│   │   ├── delete_user_everything.sh
│   │   └── user_sudo.sh
│   └── volume-management/
│       ├── add_volume.sh
│       ├── remove_volume.sh
│       └── volume_status.sh
├── penguin-system_configuration/
├── snake-scripts/
│   ├── encrypt_pdf.py
│   ├── folder_structure.py
│   ├── folder_structure_v2.py
│   ├── repo-structure-tool_not-compleated.py
│   ├── subnet_calculator_v1.py
│   ├── subnet_calculator_v2.py
│   └── vlsm_planner.py
├── wincore-scripts/
└── wincore-systems/
```
