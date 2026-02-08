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



```
