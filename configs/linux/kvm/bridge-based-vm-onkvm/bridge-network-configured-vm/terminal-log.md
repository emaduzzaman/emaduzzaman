```
ubuntu@gelani-lab-2:~$ cd /var/lib/libvirt
ubuntu@gelani-lab-2:/var/lib/libvirt$ ls
boot  dnsmasq  images  qemu  sanlock
ubuntu@gelani-lab-2:/var/lib/libvirt$ cd images/
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ ls
ls: cannot open directory '.': Permission denied
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ sudo imagetops 
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ ls
ls: cannot open directory '.': Permission denied
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ sudo sl
sudo: sl: command not found
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ sudo ls
_base  vms
ubuntu@gelani-lab-2:/var/lib/libvirt/images$ sudo bash
root@gelani-lab-2:/var/lib/libvirt/images# ls
_base  vms
root@gelani-lab-2:/var/lib/libvirt/images# cd vms
root@gelani-lab-2:/var/lib/libvirt/images/vms# ls
nat-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms# ls
nat-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms# sudo mkdir -p /var/lib/libvirt/images/vms/br-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms# sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/br-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms# sudo chmod 750 /var/lib/libvirt/images/vms/br-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms# cd /var/lib/libvirt/images/vms/br-vm1
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo qemu-img create -f qcow2 \
  -F qcow2 -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
  br-vm1.qcow2 20G
Formatting 'br-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 backing_file=/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# cat | sudo tee user-data.yaml > /dev/null <<'EOF'
#cloud-config
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    shell: /bin/bash
    lock_passwd: false

ssh_pwauth: true
chpasswd:
  list: |
    ubuntu:1234
  expire: false

package_update: true
packages:
  - qemu-guest-agent
runcmd:
  - systemctl enable --now qemu-guest-agent
EOF

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# cat | sudo tee meta-data.yaml > /dev/null <<'EOF'
instance-id: br-vm1
local-hostname: br-vm1
EOF

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo cloud-localds seed.iso user-data.yaml meta-data.yaml
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo chown libvirt-qemu:kvm seed.iso user-data.yaml meta-data.yaml
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo chmod 640 seed.iso user-data.yaml meta-data.yaml
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo virt-install \
  --name br-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/vms/br-vm1/br-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/vms/br-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network bridge=br0,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
Creating domain...                                                                                                                                                                                                   |    0 B  00:00:00     
Domain creation completed.
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# ip neigh | grep 192.168.95
192.168.95.1 dev br0 lladdr fa:16:3e:e0:2d:88 REACHABLE 
192.168.95.86 dev br0 lladdr fa:16:3e:36:75:1a REACHABLE 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo virsh domifaddr br-vm1
 Name       MAC address          Protocol     Address
-------------------------------------------------------------------------------

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo virsh console br-vm1
Connected to domain 'br-vm1'
Escape character is ^] (Ctrl + ])
[**    ] Job systemd-networkd-wait-online.se…ice/start running (34s / no limit)

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# bridge link
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 master br0 state forwarding priority 32 cost 100 
5: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 master br0 state forwarding priority 32 cost 2 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo virsh domiflist br-vm1
 Interface   Type     Source   Model    MAC
-----------------------------------------------------------
 vnet0       bridge   br0      virtio   52:54:00:c3:08:d8

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# ip neigh show dev br0
192.168.95.1 lladdr fa:16:3e:e0:2d:88 REACHABLE 
192.168.95.86 lladdr fa:16:3e:36:75:1a REACHABLE 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# ssh ubuntu@192.168.95.86
^C
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# ping 192.168.95.86
PING 192.168.95.86 (192.168.95.86) 56(84) bytes of data.
^C
--- 192.168.95.86 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2038ms

root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# sudo virsh console br-vm1
Connected to domain 'br-vm1'
Escape character is ^] (Ctrl + ])

br-vm1 login: 
br-vm1 login: 
br-vm1 login: 
br-vm1 login: 
br-vm1 login: ip a
Password: 

Login incorrect
br-vm1 login:     
Login timed out after 60 seconds.

Ubuntu 24.04.3 LTS br-vm1 ttyS0

br-vm1 login:    
br-vm1 login: ubuntu
Password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 09:15:40 UTC 2026

  System load: 0.0               Memory usage: 10%   Processes:       126
  Usage of /:  8.9% of 18.33GB   Swap usage:   0%    Users logged in: 0

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@br-vm1:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:c3:08:d8 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::5054:ff:fec3:8d8/64 scope link 
       valid_lft forever preferred_lft forever
ubuntu@br-vm1:~$ 
---
---
---
---
ubuntu@br-vm1:~$ sudo nano /etc/netplan/01-dhcp.yaml
ubuntu@br-vm1:~$ sudo cat /etc/netplan/01-dhcp.yaml
network:
  version: 2
  renderer: networkd

  ethernets:
    enp1s0:
      dhcp4: true
ubuntu@br-vm1:~$ 
ubuntu@br-vm1:~$ sudo chmod 600 /etc/netplan/01-dhcp.yaml
ubuntu@br-vm1:~$ sudo chmod 600 /etc/netplan/01-dhcp.yaml
ubuntu@br-vm1:~$ sudo netplan generate
ubuntu@br-vm1:~$ sudo netplan apply
ubuntu@br-vm1:~$ ip -br addr
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp1s0           UP             fe80::5054:ff:fec3:8d8/64 
ubuntu@br-vm1:~$ 

ubuntu@br-vm1:~$ networkctl status enp1s0
● 2: enp1s0
                   Link File: /run/systemd/network/10-netplan-enp1s0.link
                Network File: /run/systemd/network/10-netplan-enp1s0.network
                       State: degraded (configuring)
                Online state: online                                           >
                        Type: ether
                        Path: pci-0000:01:00.0
                      Driver: virtio_net
                      Vendor: Red Hat, Inc.
                       Model: Virtio 1.0 network device
            Hardware Address: 52:54:00:c3:08:d8
                         MTU: 1500 (min: 68, max: 65535)
                       QDisc: fq_codel
IPv6 Address Generation Mode: eui64
    Number of Queues (Tx/Rx): 1/1
            Auto negotiation: no
                     Address: fe80::5054:ff:fec3:8d8
           Activation Policy: up
         Required For Online: yes
lines 1-19/19 (END)
ubuntu@br-vm1:~$ sudo journalctl -u systemd-networkd -n 50 --no-pager
Feb 08 08:36:10 br-vm1 systemd[1]: Starting systemd-networkd.service - Network Configuration...
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: lo: Link UP
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: lo: Gained carrier
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: Enumeration completed
Feb 08 08:36:10 br-vm1 systemd[1]: Started systemd-networkd.service - Network Configuration.
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Configuring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Link UP
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Gained carrier
Feb 08 08:36:12 br-vm1 systemd-networkd[693]: enp1s0: Gained IPv6LL
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: Reconfiguring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: DHCPv6 lease lost
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: Configuring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: DHCPv6 lease lost
ubuntu@br-vm1:~$ 


ubuntu@gelani-lab-2:~$ ip -br link
ip -br addr
ip route
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
ens3             UP             fa:16:3e:5f:8a:1d <BROADCAST,MULTICAST,UP,LOWER_UP> 
virbr0           DOWN           52:54:00:e0:36:19 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
lo               UNKNOWN        127.0.0.1/8 ::1/128 
ens3             UP             192.168.95.113/24 metric 100 fe80::f816:3eff:fe5f:8a1d/64 
virbr0           DOWN           192.168.122.1/24 
default via 192.168.95.1 dev ens3 proto dhcp src 192.168.95.113 metric 100 
8.8.8.8 via 192.168.95.1 dev ens3 proto dhcp src 192.168.95.113 metric 100 
169.254.169.254 via 192.168.95.2 dev ens3 proto dhcp src 192.168.95.113 metric 100 
192.168.95.0/24 dev ens3 proto kernel scope link src 192.168.95.113 metric 100 
192.168.95.1 dev ens3 proto dhcp scope link src 192.168.95.113 metric 100 
192.168.95.2 dev ens3 proto dhcp scope link src 192.168.95.113 metric 100 
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 linkdown 
ubuntu@gelani-lab-2:~$ ip link show ens3
bridge link
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether fa:16:3e:5f:8a:1d brd ff:ff:ff:ff:ff:ff
    altname enp0s3
ubuntu@gelani-lab-2:~$ sudo sysctl net.bridge.bridge-nf-call-iptables
sudo sysctl net.bridge.bridge-nf-call-ip6tables
sudo sysctl net.bridge.bridge-nf-call-arptables
sysctl: cannot stat /proc/sys/net/bridge/bridge-nf-call-iptables: No such file or directory
sysctl: cannot stat /proc/sys/net/bridge/bridge-nf-call-ip6tables: No such file or directory
sysctl: cannot stat /proc/sys/net/bridge/bridge-nf-call-arptables: No such file or directory
ubuntu@gelani-lab-2:~$ ip link show ens3 | grep PROMISC || true
ubuntu@gelani-lab-2:~$ sudo tcpdump -ni ens3 -vv 'port 67 or port 68'
tcpdump: listening on ens3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:~$ networkctl status ens3 --no-pager
networkctl status br0 --no-pager
● 2: ens3
                   Link File: /run/systemd/network/10-netplan-ens3.link
                Network File: /run/systemd/network/10-netplan-ens3.network
                       State: routable (configured)
                Online state: online                                         
                        Type: ether
                        Path: pci-0000:00:03.0
                      Driver: virtio_net
                      Vendor: Red Hat, Inc.
                       Model: Virtio network device
           Alternative Names: enp0s3
            Hardware Address: fa:16:3e:5f:8a:1d
                         MTU: 8942 (min: 68, max: 8942)
                       QDisc: fq_codel
IPv6 Address Generation Mode: eui64
    Number of Queues (Tx/Rx): 1/1
            Auto negotiation: no
                     Address: 192.168.95.113 (DHCP4 via 192.168.95.1)
                              fe80::f816:3eff:fe5f:8a1d
                     Gateway: 192.168.95.1
                         DNS: 8.8.8.8
              Search Domains: openstack.internal
           Activation Policy: up
         Required For Online: yes
             DHCP4 Client ID: IAID:0xb55e67ff/DUID
           DHCP6 Client DUID: DUID-EN/Vendor:0000ab11237a18689fd21575

Feb 08 07:53:25 gelani-lab-2 (udev-worker)[423]: ens3: Could not set WakeOnLan to off, ignoring: Operation not supported
Feb 08 07:53:26 gelani-lab-2 systemd-networkd[652]: ens3: Configuring with /run/systemd/network/10-netplan-ens3.network.
Feb 08 07:53:26 gelani-lab-2 systemd-networkd[652]: ens3: Link UP
Feb 08 07:53:26 gelani-lab-2 systemd-networkd[652]: ens3: Gained carrier
Feb 08 07:53:26 gelani-lab-2 systemd-networkd[652]: ens3: DHCPv4 address 192.168.95.113/24, gateway 192.168.95.1 acquired from 192.168.95.1
Feb 08 07:53:28 gelani-lab-2 systemd-networkd[652]: ens3: Gained IPv6LL
Interface "br0" not found.
ubuntu@gelani-lab-2:~$ sudo cat /etc/netplan/*.yaml
network:
  version: 2
  ethernets:
    ens3:
      match:
        macaddress: "fa:16:3e:5f:8a:1d"
      dhcp4: true
      set-name: "ens3"
      mtu: 8942
ubuntu@gelani-lab-2:~$ lsmod | grep bridge
bridge                425984  0
stp                    12288  1 bridge
llc                    16384  2 bridge,stp
ubuntu@gelani-lab-2:~$ 
ubuntu@br-vm1:~$ sudo journalctl -u systemd-networkd -n 50 --no-pager
Feb 08 08:36:10 br-vm1 systemd[1]: Starting systemd-networkd.service - Network Configuration...
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: lo: Link UP
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: lo: Gained carrier
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: Enumeration completed
Feb 08 08:36:10 br-vm1 systemd[1]: Started systemd-networkd.service - Network Configuration.
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Configuring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Link UP
Feb 08 08:36:10 br-vm1 systemd-networkd[693]: enp1s0: Gained carrier
Feb 08 08:36:12 br-vm1 systemd-networkd[693]: enp1s0: Gained IPv6LL
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: Reconfiguring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: DHCPv6 lease lost
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: Configuring with /run/systemd/network/10-netplan-enp1s0.network.
Feb 08 09:21:36 br-vm1 systemd-networkd[693]: enp1s0: DHCPv6 lease lost
ubuntu@br-vm1:~$ sudo netplan apply
ubuntu@br-vm1:~$ 
root@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1# 

ubuntu@gelani-lab-2:~$ sudo tcpdump -ni br0 port 67 or port 68
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on br0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
09:23:45.128779 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:23:54.023206 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:23:54.041547 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:23:58.683352 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:24:03.509337 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:24:12.462552 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:24:14.237870 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:24:28.000322 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:24:59.031967 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:25:17.958909 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:26:03.276357 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:26:22.916124 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:27:06.956747 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:27:27.124684 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:28:10.067127 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:28:30.379333 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:29:14.334473 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:29:34.403587 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:30:19.332918 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:30:38.921484 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:31:24.302108 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:31:42.009927 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:32:28.040345 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:32:45.451237 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:33:31.603577 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:33:49.592555 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:34:36.522244 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:34:53.372330 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:35:41.100432 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:35:57.839459 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:36:45.257344 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:37:01.010011 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:37:48.404793 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:38:04.487145 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:38:53.119211 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 52:54:00:c3:08:d8, length 293
09:39:08.701704 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293
09:40:13.023921 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 36:9a:ac:2b:72:e7, length 293




emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-100-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 09:25:40 UTC 2026

  System load:  0.0                Processes:            166
  Usage of /:   10.7% of 47.39GB   Users logged in:      2
  Memory usage: 13%                IPv4 address for br0: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Sun Feb  8 09:23:35 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ bridge link
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 master br0 state forwarding priority 32 cost 100 
5: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 master br0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:~$ bridge fdb show br br0
22:72:90:37:f9:ea dev ens3 master br0 
fa:16:3e:df:a6:41 dev ens3 master br0 
fa:16:3e:79:ba:a6 dev ens3 master br0 
fa:16:3e:a0:02:03 dev ens3 master br0 
fa:16:3e:0b:59:14 dev ens3 master br0 
fa:16:3e:36:75:1a dev ens3 master br0 
36:9a:ac:2b:72:e7 dev ens3 master br0 
fa:16:3e:90:98:9c dev ens3 master br0 
fa:16:3e:e0:2d:88 dev ens3 master br0 
33:33:00:00:00:01 dev ens3 self permanent
01:00:5e:00:00:01 dev ens3 self permanent
01:80:c2:00:00:00 dev ens3 self permanent
01:80:c2:00:00:03 dev ens3 self permanent
01:80:c2:00:00:0e dev ens3 self permanent
33:33:00:00:00:01 dev br0 self permanent
01:00:5e:00:00:6a dev br0 self permanent
33:33:00:00:00:6a dev br0 self permanent
01:00:5e:00:00:01 dev br0 self permanent
33:33:ff:d8:85:d2 dev br0 self permanent
fa:16:3e:5f:8a:1d dev br0 vlan 1 master br0 permanent
fa:16:3e:5f:8a:1d dev br0 master br0 permanent
52:54:00:c3:08:d8 dev vnet0 master br0 
fe:54:00:c3:08:d8 dev vnet0 vlan 1 master br0 permanent
fe:54:00:c3:08:d8 dev vnet0 master br0 permanent
33:33:00:00:00:01 dev vnet0 self permanent
01:00:5e:00:00:01 dev vnet0 self permanent
33:33:ff:c3:08:d8 dev vnet0 self permanent
ubuntu@gelani-lab-2:~$ openstack port list --server gelani-lab-2
Command 'openstack' not found, but can be installed with:
sudo snap install openstackclients         # version xena, or
sudo apt  install python3-openstackclient  # version 6.3.0-0ubuntu1
See 'snap info openstackclients' for additional versions.
ubuntu@gelani-lab-2:~$ sudo virsh destroy br-vm1
Domain 'br-vm1' destroyed

ubuntu@gelani-lab-2:~$ 
ubuntu@gelani-lab-2:~$ sudo virsh undefine br-vm1
Domain 'br-vm1' has been undefined

ubuntu@gelani-lab-2:~$ sudo virt-install \
  --name br-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/vms/br-vm1/br-vm1.qcow2,format=qcow2 \
  --disk path=/var/lib/libvirt/images/vms/br-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network type=direct,source=ens3,source_mode=bridge,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
ERROR    error creating macvtap interface macvtap0@ens3 (52:54:00:0d:54:06): Device or resource busy
Domain installation does not appear to have been successful.
If it was, you can restart your domain by running:
  virsh --connect qemu:///system start br-vm1
otherwise, please restart your installation.
ubuntu@gelani-lab-2:~$   virsh --connect qemu:///system start br-vm1
error: failed to get domain 'br-vm1'

ubuntu@gelani-lab-2:~$ 

---
---
---
---
---
---
#use static ip and this issue solves the issue
ubuntu@gelani-lab-2:~$ sudo virsh destroy br-vm1 2>/dev/null || true

ubuntu@gelani-lab-2:~$ sudo virsh undefine br-vm1 2>/dev/null || true

ubuntu@gelani-lab-2:~$ sudo rm -rf /var/lib/libvirt/images/vms/br-vm1
ubuntu@gelani-lab-2:~$ cat | sudo tee /tmp/br0-net.xml >/dev/null <<'EOF'
<network>
  <name>br0-net</name>
  <forward mode='bridge'/>
  <bridge name='br0' delay='0'/>
</network>
EOF

ubuntu@gelani-lab-2:~$ sudo virsh net-define /tmp/br0-net.xml
Network br0-net defined from /tmp/br0-net.xml

ubuntu@gelani-lab-2:~$ sudo virsh net-start br0-net
Network br0-net started

ubuntu@gelani-lab-2:~$ sudo virsh net-autostart br0-net
Network br0-net marked as autostarted

ubuntu@gelani-lab-2:~$ sudo virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 br0-net   active   yes         yes
 default   active   yes         yes

ubuntu@gelani-lab-2:~$ sudo mkdir -p /var/lib/libvirt/images/vms/br-vm1
ubuntu@gelani-lab-2:~$ sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/br-vm1
ubuntu@gelani-lab-2:~$ sudo chmod 750 /var/lib/libvirt/images/vms/br-vm1
ubuntu@gelani-lab-2:~$ cd /var/lib/libvirt/images/vms/br-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo qemu-img create -f qcow2 \
  -F qcow2 -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
  br-vm1.qcow2 20G
Formatting 'br-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 backing_file=/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ ping -c 2 192.168.95.191 || true
PING 192.168.95.191 (192.168.95.191) 56(84) bytes of data.
64 bytes from 192.168.95.191: icmp_seq=1 ttl=64 time=9.74 ms
64 bytes from 192.168.95.191: icmp_seq=2 ttl=64 time=3.55 ms

--- 192.168.95.191 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 3.549/6.646/9.744/3.097 ms
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ ip neigh | grep 192.168.95.191 || true
192.168.95.191 dev br0 lladdr 52:54:00:f2:7e:3e REACHABLE 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ cat | sudo tee user-data >/dev/null <<'EOF'
#cloud-config
ssh_pwauth: true
chpasswd:
  list: |
    ubuntu:1234
  expire: false
packages:
  - qemu-guest-agent
runcmd:
  - systemctl enable --now qemu-guest-agent
EOF

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ cat | sudo tee meta-data >/dev/null <<'EOF'
instance-id: br-vm1
local-hostname: br-vm1
EOF

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ cat | sudo tee network-config >/dev/null <<'EOF'
version: 2
ethernets:
  enp1s0:
    dhcp4: false
    addresses:
      - 192.168.95.191/24
    routes:
      - to: default
        via: 192.168.95.1
    nameservers:
      addresses: [8.8.8.8, 1.1.1.1]
EOF

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo cloud-localds br-vm1-seed.iso user-data meta-data --network-config=network-config
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo chown libvirt-qemu:kvm br-vm1-seed.iso user-data meta-data network-config
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo chmod 640 br-vm1-seed.iso user-data meta-data network-config
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo virt-install \
  --name br-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=$PWD/br-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=$PWD/br-vm1-seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=br0-net,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
Creating domain...                                                                                                                                                                                                   |    0 B  00:00:00     
Domain creation completed.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ sudo virsh list --all
 Id   Name      State
--------------------------
 1    br-vm1    running
 -    nat-vm1   shut off

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ ping -c 3 192.168.95.191
PING 192.168.95.191 (192.168.95.191) 56(84) bytes of data.
64 bytes from 192.168.95.191: icmp_seq=1 ttl=64 time=0.316 ms
64 bytes from 192.168.95.191: icmp_seq=2 ttl=64 time=0.207 ms
64 bytes from 192.168.95.191: icmp_seq=3 ttl=64 time=0.201 ms

--- 192.168.95.191 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2039ms
rtt min/avg/max/mdev = 0.201/0.241/0.316/0.052 ms
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/br-vm1$ ssh ubuntu@192.168.95.191
The authenticity of host '192.168.95.191 (192.168.95.191)' can't be established.
ED25519 key fingerprint is SHA256:wc2FWDbwXoHPPeGkGct8NFM2J/ivep9gLYBXcHIN168.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.95.191' (ED25519) to the list of known hosts.
ubuntu@192.168.95.191's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 09:53:02 UTC 2026

  System load:  0.49              Processes:               150
  Usage of /:   9.8% of 18.33GB   Users logged in:         0
  Memory usage: 16%               IPv4 address for enp1s0: 192.168.95.191
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@br-vm1:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:23:f4:46 brd ff:ff:ff:ff:ff:ff
    inet 192.168.95.191/24 brd 192.168.95.255 scope global enp1s0
       valid_lft forever preferred_lft forever
    inet6 fe80::5054:ff:fe23:f446/64 scope link 
       valid_lft forever preferred_lft forever
ubuntu@br-vm1:~$ ping google.com
PING google.com (142.250.192.206) 56(84) bytes of data.
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=1 ttl=116 time=51.2 ms
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=2 ttl=116 time=48.1 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 48.144/49.677/51.211/1.533 ms
ubuntu@br-vm1:~$ ^C
ubuntu@br-vm1:~$ ^C
ubuntu@br-vm1:~$ 




```
