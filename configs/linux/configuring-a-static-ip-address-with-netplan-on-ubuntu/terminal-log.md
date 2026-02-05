# Terminal Log

```bash
ubuntu@gelani:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:36:cb:9f brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.95.215/24 metric 100 brd 192.168.95.255 scope global dynamic ens3
       valid_lft 43182sec preferred_lft 43182sec
    inet6 fe80::f816:3eff:fe36:cb9f/64 scope link
       valid_lft forever preferred_lft forever

ubuntu@gelani:~$ networkctl status ens3
● 2: ens3
                     Link File: /usr/lib/systemd/network/99-default.link
                  Network File: /run/systemd/network/10-netplan-ens3.network
                          Type: ether
                         State: routable (configured)
                  Online state: online
             Alternative Names: enp0s3
                          Path: pci-0000:00:03.0
                        Driver: virtio_net
                        Vendor: Red Hat, Inc.
                         Model: Virtio network device
                    HW Address: fa:16:3e:36:cb:9f
                           MTU: 8942 (min: 68, max: 8942)
                         QDisc: fq_codel
  IPv6 Address Generation Mode: eui64
          Queue Length (Tx/Rx): 1/1
              Auto negotiation: no
                         Speed: n/a
                       Address: 192.168.95.215 (DHCP4 via 192.168.95.1)
                                fe80::f816:3eff:fe36:cb9f
                       Gateway: 192.168.95.1
                           DNS: 8.8.8.8
                Search Domains: openstack.internal
             Activation Policy: up
           Required For Online: yes
               DHCP4 Client ID: IAID:0xb55e67ff/DUID
             DHCP6 Client DUID: DUID-EN/Vendor:0000ab11c4f8b6b227bc836c0000

ubuntu@gelani:~$ sudo bash
root@gelani:/home/ubuntu# cat /etc/netplan/50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    version: 2
    ethernets:
        ens3:
            dhcp4: true
            match:
                macaddress: fa:16:3e:36:cb:9f
            mtu: 8942
            set-name: ens3

root@gelani:/home/ubuntu# nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
root@gelani:/home/ubuntu# cat /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
network: {config:disable}

root@gelani:/home/ubuntu# vi /etc/netplan/50-cloud-init.yaml
root@gelani:/home/ubuntu# cat /etc/netplan/50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    version: 2
    ethernets:
        ens3:
            dhcp4: no
            addresses:
              - 192.168.95.215/24
            routes:
              - to: default
                via: 192.168.95.1
                nameservers:
                  addresses:
                    -8.8.8.8
            match:
                macaddress: fa:16:3e:36:cb:9f
            mtu: 8942
            set-name: ens3

root@gelani:/home/ubuntu# netplan apply
/etc/netplan/50-cloud-init.yaml:16:17: Error in network definition: unknown key 'nameservers'
                nameservers:
                ^

root@gelani:/home/ubuntu# vi /etc/netplan/50-cloud-init.yaml
root@gelani:/home/ubuntu# vi /etc/netplan/50-cloud-init.yaml
root@gelani:/home/ubuntu# netplan apply
/etc/netplan/50-cloud-init.yaml:18:17: Error in network definition: expected sequence
                -8.8.8.8
                ^

root@gelani:/home/ubuntu# vi /etc/netplan/50-cloud-init.yaml
root@gelani:/home/ubuntu# netplan apply
WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.

root@gelani:/home/ubuntu# netplan generate
root@gelani:/home/ubuntu# netplan apply
WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.

root@gelani:/home/ubuntu# networkctl status ens3
● 2: ens3
                     Link File: /run/systemd/network/10-netplan-ens3.link
                  Network File: /run/systemd/network/10-netplan-ens3.network
                          Type: ether
                         State: routable (configured)
                  Online state: online
             Alternative Names: enp0s3
                          Path: pci-0000:00:03.0
                        Driver: virtio_net
                        Vendor: Red Hat, Inc.
                         Model: Virtio network device
                    HW Address: fa:16:3e:36:cb:9f
                           MTU: 8942 (min: 68, max: 8942)
                         QDisc: fq_codel
  IPv6 Address Generation Mode: eui64
          Queue Length (Tx/Rx): 1/1
              Auto negotiation: no
                         Speed: n/a
                       Address: 192.168.95.215
                                fe80::f816:3eff:fe36:cb9f
                       Gateway: 192.168.95.1
                           DNS: 8.8.8.8
             Activation Policy: up
           Required For Online: yes
             DHCP6 Client DUID: DUID-EN/Vendor:0000ab11c4f8b6b227bc836c0000
```
