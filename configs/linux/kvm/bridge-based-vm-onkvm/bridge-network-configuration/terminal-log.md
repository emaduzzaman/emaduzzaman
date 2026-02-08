```
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ip -br link
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
ens3             UP             fa:16:3e:5f:8a:1d <BROADCAST,MULTICAST,UP,LOWER_UP> 
virbr0           UP             52:54:00:e0:36:19 <BROADCAST,MULTICAST,UP,LOWER_UP> 
vnet0            UNKNOWN        fe:54:00:5a:23:45 <BROADCAST,MULTICAST,UP,LOWER_UP> 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ip -br addr | grep -E 'ens|enp|eth'
ens3             UP             192.168.95.113/24 metric 100 fe80::f816:3eff:fe5f:8a1d/64 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo cp -a /etc/netplan /etc/netplan.bak.$(date +%F-%H%M)
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ls -l /etc/netplan
total 4
-rw------- 1 root root 155 Feb  7 12:07 50-cloud-init.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ls /etc/netplan
50-cloud-init.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ cd /etc/netpaln
-bash: cd: /etc/netpaln: No such file or directory
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ls
meta-data.yaml  nat-vm1.qcow2  seed.iso  user-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ cd /etc/netplan
ubuntu@gelani-lab-2:/etc/netplan$ ls
50-cloud-init.yaml
ubuntu@gelani-lab-2:/etc/netplan$ cp 50-cloud-init.yaml 50-cloud-init.yaml.bak
cp: cannot open '50-cloud-init.yaml' for reading: Permission denied
ubuntu@gelani-lab-2:/etc/netplan$ sudo cp 50-cloud-init.yaml 50-cloud-init.yaml.bak
ubuntu@gelani-lab-2:/etc/netplan$ ls
50-cloud-init.yaml  50-cloud-init.yaml.bak
ubuntu@gelani-lab-2:/etc/netplan$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:/etc/netplan$ sudo cat /etc/netplan/50-cloud-init.yaml
network:
  version: 2
  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      dhcp4: true
      set-name: "ens3"
      mtu: 8942
ubuntu@gelani-lab-2:/etc/netplan$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:/etc/netplan$ sudo netplan generate
ubuntu@gelani-lab-2:/etc/netplan$ sudo netplan apply
ubuntu@gelani-lab-2:/etc/netplan$ 
ubuntu@gelani-lab-2:/etc/netplan$ 
ubuntu@gelani-lab-2:/etc/netplan$ 
ubuntu@gelani-lab-2:/etc/netplan$ 
ubuntu@gelani-lab-2:/etc/netplan$ 
ubuntu@gelani-lab-2:/etc/netplan$ ^C
ubuntu@gelani-lab-2:/etc/netplan$ ^C
ubuntu@gelani-lab-2:/etc/netplan$ ^C
ubuntu@gelani-lab-2:/etc/netplan$ 

---
---
---
---
##Lost internet connection!
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ssh: connect to host 192.168.95.113 port 22: No route to host
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 06:41:57 UTC 2026

  System load:  0.0                Processes:             154
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 31%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 05:26:44 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ 

#Internet connection restroed by editing the default netpaln config
ubuntu@gelani-lab-2:~$ ls -l /etc/netplan
for f in /etc/netplan/*.yaml; do echo "===== $f ====="; sudo cat "$f"; echo; done
total 8
-rw------- 1 root root 155 Feb  8 06:40 50-cloud-init.yaml
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml.bak
===== /etc/netplan/50-cloud-init.yaml =====
network:
  version: 2
  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      dhcp4: true
      set-name: "ens3"
      mtu: 8942

ubuntu@gelani-lab-2:~$ ip -br addr
ip route
resolvectl status | sed -n '1,200p'
lo               UNKNOWN        127.0.0.1/8 ::1/128 
ens3             UP             192.168.95.113/24 metric 100 fe80::f816:3eff:fe5f:8a1d/64 
virbr0           UP             192.168.122.1/24 
vnet0            UNKNOWN        fe80::fc54:ff:fe5a:2345/64 
br0              DOWN           fe80::74c9:96ff:fed8:85d2/64 
default via 192.168.95.1 dev ens3 proto dhcp src 192.168.95.113 metric 100 
8.8.8.8 via 192.168.95.1 dev ens3 proto dhcp src 192.168.95.113 metric 100 
169.254.169.254 via 192.168.95.2 dev ens3 proto dhcp src 192.168.95.113 metric 100 
192.168.95.0/24 dev ens3 proto kernel scope link src 192.168.95.113 metric 100 
192.168.95.1 dev ens3 proto dhcp scope link src 192.168.95.113 metric 100 
192.168.95.2 dev ens3 proto dhcp scope link src 192.168.95.113 metric 100 
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 
Global
         Protocols: -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
  resolv.conf mode: stub

Link 2 (ens3)
    Current Scopes: DNS
         Protocols: +DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 8.8.8.8
       DNS Servers: 8.8.8.8
        DNS Domain: openstack.internal

Link 15 (virbr0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 16 (vnet0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 17 (br0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
ubuntu@gelani-lab-2:~$ networkctl status --no-pager
networkctl list --no-pager
● Interfaces: 2, 17, 15, 16, 1
         State: routable                         
  Online state: online                           
       Address: 192.168.95.113 on ens3
                192.168.122.1 on virbr0
                fe80::f816:3eff:fe5f:8a1d on ens3
                fe80::fc54:ff:fe5a:2345 on vnet0
                fe80::74c9:96ff:fed8:85d2 on br0
       Gateway: 192.168.95.1 on ens3
           DNS: 8.8.8.8
Search Domains: openstack.internal

Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: /run/systemd/network/10-netplan-ens3.network: MTUBytes= in [Link] section and UseMTU= in [DHCP] section are set. Disabling UseMTU=.
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: ens3: Reconfiguring with /run/systemd/network/10-netplan-ens3.network.
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: br0: Unmanaging interface.
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: br0: DHCPv6 lease lost
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: ens3: Link UP
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: ens3: Gained carrier
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: br0: Lost carrier
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: ens3: Configuring with /run/systemd/network/10-netplan-ens3.network.
Feb 08 06:40:41 gelani-lab-2 systemd-networkd[4257]: ens3: DHCPv4 address 192.168.95.113/24, gateway 192.168.95.1 acquired from 192.168.95.1
Feb 08 06:40:43 gelani-lab-2 systemd-networkd[4257]: ens3: Gained IPv6LL
IDX LINK   TYPE     OPERATIONAL SETUP     
  1 lo     loopback carrier     unmanaged
  2 ens3   ether    routable    configured
 15 virbr0 bridge   routable    unmanaged
 16 vnet0  ether    enslaved    unmanaged
 17 br0    bridge   no-carrier  unmanaged

5 links listed.
ubuntu@gelani-lab-2:~$ systemctl is-active NetworkManager || true
nmcli dev status 2>/dev/null || true
inactive
ubuntu@gelani-lab-2:~$ ip -br link
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
ens3             UP             fa:16:3e:5f:8a:1d <BROADCAST,MULTICAST,UP,LOWER_UP> 
virbr0           UP             52:54:00:e0:36:19 <BROADCAST,MULTICAST,UP,LOWER_UP> 
vnet0            UNKNOWN        fe:54:00:5a:23:45 <BROADCAST,MULTICAST,UP,LOWER_UP> 
br0              DOWN           76:c9:96:d8:85:d2 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
ubuntu@gelani-lab-2:~$ 
ubuntu@gelani-lab-2:~$ sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null <<'EOF'
network:
  version: 2
  renderer: networkd

  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      set-name: "ens3"
      dhcp4: false
      mtu: 8942

  bridges:
    br0:
      interfaces: [ens3]
      dhcp4: true
      mtu: 8942
      parameters:
        stp: false
        forward-delay: 0
EOF
ubuntu@gelani-lab-2:~$ sudo netplan generate
ubuntu@gelani-lab-2:~$ sudo netplan apply
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 06:50:07 UTC 2026

  System load:  0.0                Processes:             160
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 31%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 06:41:57 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo netplan apply
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ 
ubuntu@gelani-lab-2:~$ sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null <<'EOF'
network:
  version: 2
  renderer: networkd

  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      set-name: "ens3"
      dhcp4: false
      mtu: 8942

  bridges:
    br0:
      interfaces: [ens3]
      dhcp4: true
      mtu: 8942
      parameters:
        stp: false
        forward-delay: 0
EOF
ubuntu@gelani-lab-2:~$ sudo netplan generate
ubuntu@gelani-lab-2:~$ sudo netplan apply
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ 

emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 06:50:07 UTC 2026

  System load:  0.0                Processes:             160
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 31%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 06:41:57 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo netplan apply
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ls
kvm
ubuntu@gelani-lab-2:~$ ls
kvm
ubuntu@gelani-lab-2:~$ cat /etc/netplan/50-cloud-init.yaml
cat: /etc/netplan/50-cloud-init.yaml: Permission denied
ubuntu@gelani-lab-2:~$ sudo cat /etc/netplan/50-cloud-init.yaml
network:
  version: 2
  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      dhcp4: true
      set-name: "ens3"
      mtu: 8942
ubuntu@gelani-lab-2:~$ sudo mkdir -p /etc/cloud/cloud.cfg.d
ubuntu@gelani-lab-2:~$ echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
network: {config: disabled}
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/01-br0.yaml
ubuntu@gelani-lab-2:~$ sudo netplan apply

** (generate:33132): WARNING **: 06:58:03.063: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33130): WARNING **: 06:58:03.310: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33130): WARNING **: 06:58:03.429: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ ^C
ubuntu@gelani-lab-2:~$ 
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 06:59:44 UTC 2026

  System load:  0.0                Processes:             162
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 31%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 06:50:08 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ cd /etc/netplan
ubuntu@gelani-lab-2:/etc/netplan$ ls
01-br0.yaml.bak  50-cloud-init.yaml  50-cloud-init.yaml.bak
ubuntu@gelani-lab-2:/etc/netplan$ nano 01-br0.yaml.bak 
ubuntu@gelani-lab-2:/etc/netplan$ sudo bash
root@gelani-lab-2:/etc/netplan# mv 01-br0.yaml.bak 01-br0.yaml
root@gelani-lab-2:/etc/netplan# cat 01-br0.yaml 
network:
  version: 2
  renderer: networkd

  ethernets:
    ens3:
      dhcp4: no
      dhcp6: no

  bridges:
    br0:
      interfaces: [ens3]
      dhcp4: yes
      dhcp6: no
      mtu: 8942
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
      parameters:
        stp: false
        forward-delay: 0
root@gelani-lab-2:/etc/netplan# nano 01-br0.yaml 
root@gelani-lab-2:/etc/netplan# sudo mv /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.disabled
root@gelani-lab-2:/etc/netplan# sudo netplan generate
sudo netplan apply

** (generate:33433): WARNING **: 07:02:47.225: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (generate:33485): WARNING **: 07:02:47.674: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33483): WARNING **: 07:02:47.921: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33483): WARNING **: 07:02:48.029: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# 
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 06:59:44 UTC 2026

  System load:  0.0                Processes:             162
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 31%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 06:50:08 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ cd /etc/netplan
ubuntu@gelani-lab-2:/etc/netplan$ ls
01-br0.yaml.bak  50-cloud-init.yaml  50-cloud-init.yaml.bak
ubuntu@gelani-lab-2:/etc/netplan$ nano 01-br0.yaml.bak 
ubuntu@gelani-lab-2:/etc/netplan$ sudo bash
root@gelani-lab-2:/etc/netplan# mv 01-br0.yaml.bak 01-br0.yaml
root@gelani-lab-2:/etc/netplan# cat 01-br0.yaml 
network:
  version: 2
  renderer: networkd

  ethernets:
    ens3:
      dhcp4: no
      dhcp6: no

  bridges:
    br0:
      interfaces: [ens3]
      dhcp4: yes
      dhcp6: no
      mtu: 8942
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
      parameters:
        stp: false
        forward-delay: 0
root@gelani-lab-2:/etc/netplan# nano 01-br0.yaml 
root@gelani-lab-2:/etc/netplan# sudo mv /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.disabled
root@gelani-lab-2:/etc/netplan# sudo netplan generate
sudo netplan apply

** (generate:33433): WARNING **: 07:02:47.225: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (generate:33485): WARNING **: 07:02:47.674: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33483): WARNING **: 07:02:47.921: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.

** (process:33483): WARNING **: 07:02:48.029: Permissions for /etc/netplan/01-br0.yaml are too open. Netplan configuration should NOT be accessible by others.
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ls
01-br0.yaml.bak  50-cloud-init.yaml  50-cloud-init.yaml.bak
root@gelani-lab-2:/etc/netplan# cat 50-cloud-init.yaml
network:
  version: 2
  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      dhcp4: true
      set-name: "ens3"
      mtu: 8942
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# sudo chown root:root /etc/netplan/*.yaml
sudo chmod 600 /etc/netplan/*.yaml
ls -l /etc/netplan
total 12
-rw-r--r-- 1 root root 407 Feb  8 07:02 01-br0.yaml.bak
-rw------- 1 root root 155 Feb  8 06:55 50-cloud-init.yaml
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml.bak
root@gelani-lab-2:/etc/netplan# sudo nano /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo rm -f /etc/netplan/01-br0.yaml
ls -l /etc/netplan
total 12
-rw-r--r-- 1 root root 407 Feb  8 07:02 01-br0.yaml.bak
-rw------- 1 root root 319 Feb  8 07:10 50-cloud-init.yaml
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml.bak
root@gelani-lab-2:/etc/netplan# ls -l /etc/netplan
total 12
-rw-r--r-- 1 root root 407 Feb  8 07:02 01-br0.yaml.bak
-rw------- 1 root root 319 Feb  8 07:10 50-cloud-init.yaml
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml.bak
root@gelani-lab-2:/etc/netplan# sudo netplan generate
root@gelani-lab-2:/etc/netplan# sudo netplan apply
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# ls -l /etc/netplan
total 8
-rw-r--r-- 1 root root 407 Feb  8 07:02 01-br0.yaml.bak
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# rm -r 01-br0.yaml.bak 
root@gelani-lab-2:/etc/netplan# ls -l /etc/netplan
total 4
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo chown root:root /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo chmod 600 /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo nano /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo netplan generate
root@gelani-lab-2:/etc/netplan# sudo netplan try
Do you want to keep these settings?


Press ENTER before the timeout to accept the new configuration


Changes will revert in   1 seconds
Reverting.
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# sudo nano /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo netplan try


root@gelani-lab-2:/etc/netplan# ls -l /etc/netplan
total 8
-rw-r--r-- 1 root root 407 Feb  8 07:02 01-br0.yaml.bak
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# rm -r 01-br0.yaml.bak 
root@gelani-lab-2:/etc/netplan# ls -l /etc/netplan
total 4
-rw------- 1 root root 155 Feb  8 06:30 50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo chown root:root /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo chmod 600 /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo nano /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo netplan generate
root@gelani-lab-2:/etc/netplan# sudo netplan try
Do you want to keep these settings?


Press ENTER before the timeout to accept the new configuration


Changes will revert in   1 seconds
Reverting.
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# sudo nano /etc/netplan/50-cloud-init.yaml
root@gelani-lab-2:/etc/netplan# sudo netplan try
Do you want to keep these settings?


Press ENTER before the timeout to accept the new configuration


Changes will revert in   1 seconds
Reverting.
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# 
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# ^C
root@gelani-lab-2:/etc/netplan# sudo dhclient -v -r br0 || true
sudo: dhclient: command not found
root@gelani-lab-2:/etc/netplan# sudo dhclient -v br0
sudo: dhclient: command not found
root@gelani-lab-2:/etc/netplan# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:5f:8a:1d brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.95.113/24 metric 100 brd 192.168.95.255 scope global dynamic ens3
       valid_lft 42077sec preferred_lft 42077sec
    inet6 fe80::f816:3eff:fe5f:8a1d/64 scope link 
       valid_lft forever preferred_lft forever
15: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 52:54:00:e0:36:19 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
16: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master virbr0 state UNKNOWN group default qlen 1000
    link/ether fe:54:00:5a:23:45 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::fc54:ff:fe5a:2345/64 scope link 
       valid_lft forever preferred_lft forever
17: br0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 76:c9:96:d8:85:d2 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::74c9:96ff:fed8:85d2/64 scope link 
       valid_lft forever preferred_lft forever
root@gelani-lab-2:/etc/netplan# 
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-100-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 07:58:03 UTC 2026

  System load:  0.0                Processes:             156
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 3%                 IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Sun Feb  8 07:53:52 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ sudo dhclient -v br0
sudo: dhclient: command not found
ubuntu@gelani-lab-2:~$ sudo dhclient -v br0
sudo: dhclient: command not found
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo chown root:root /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo chmod 600 /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo netplan generate
ubuntu@gelani-lab-2:~$ sudo netplan apply
client_loop: send disconnect: Broken pipe
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-100-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 08:25:54 UTC 2026

  System load:  0.0                Processes:             152
  Usage of /:   10.5% of 47.39GB   Users logged in:       1
  Memory usage: 3%                 IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Sun Feb  8 07:58:03 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ 
---
---
---
---
---
---
---
---
---
#finally it worked and here is the log:
ubuntu@gelani-lab-2:~$ sudo nano /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo chmod 600 /etc/netplan/50-cloud-init.yaml
ubuntu@gelani-lab-2:~$ sudo cat /etc/netplan/50-cloud-init.yaml
#network:
#  version: 2
#  ethernets:
#    ens3:
#      match:
#        macaddress: "fa:16:3e:5f:8a:1d"
#      dhcp4: true
#      set-name: "ens3"
#      mtu: 8942
network:
  version: 2
  renderer: networkd

  ethernets:
    ens3:
      match:
        macaddress: fa:16:3e:5f:8a:1d
      set-name: ens3
      dhcp4: false
      mtu: 8942

  bridges:
    br0:
      interfaces:
        - ens3
      dhcp4: true
      mtu: 8942
      macaddress: fa:16:3e:5f:8a:1d
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
ubuntu@gelani-lab-2:~$ sudo netplan try
Do you want to keep these settings?


Press ENTER before the timeout to accept the new configuration


Changes will revert in 100 seconds
Configuration accepted.
ubuntu@gelani-lab-2:~$ ping google.com
PING google.com (142.250.192.206) 56(84) bytes of data.
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=1 ttl=116 time=51.0 ms
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=2 ttl=116 time=49.6 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 49.564/50.269/50.975/0.705 ms
ubuntu@gelani-lab-2:~$ ip -br addr
lo               UNKNOWN        127.0.0.1/8 ::1/128 
ens3             UP             
virbr0           DOWN           192.168.122.1/24 
br0              UP             192.168.95.113/24 metric 100 fe80::74c9:96ff:fed8:85d2/64 
ubuntu@gelani-lab-2:~$ 




```
