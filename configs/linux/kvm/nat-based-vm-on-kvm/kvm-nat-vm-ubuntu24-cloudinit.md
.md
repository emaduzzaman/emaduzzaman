# KVM NAT Virtual Machine Setup on Ubuntu 24.04 (Cloud Image + Base Image Cache)

This guide explains how to:

* Install KVM and libvirt
* Configure NAT networking
* Create a reusable base image cache
* Create NAT virtual machines using qcow2 overlays
* Use cloud-init for automatic VM configuration

This method is efficient because:

* Base image is downloaded once
* Overlay disks save storage space
* VM creation is fast and repeatable

---

# 1. Install KVM and Required Packages

```bash
sudo apt update && sudo apt upgrade -y

egrep -c '(vmx|svm)' /proc/cpuinfo
lsmod | egrep 'kvm|kvm_intel|kvm_amd' || true

sudo apt install -y \
  qemu-kvm \
  libvirt-daemon-system \
  libvirt-clients \
  virtinst \
  bridge-utils \
  cloud-image-utils \
  libguestfs-tools \
  tcpdump
```

Enable libvirt:

```bash
sudo systemctl enable --now libvirtd
sudo systemctl status libvirtd --no-pager
```

Add user to libvirt group:

```bash
sudo usermod -aG libvirt,kvm $USER
```

Logout and login again.

---

# 2. Reset and Configure Default NAT Network

```bash
sudo virsh net-destroy default 2>/dev/null || true
sudo virsh net-undefine default 2>/dev/null || true

sudo virsh net-define /usr/share/libvirt/networks/default.xml
sudo virsh net-start default
sudo virsh net-autostart default

sudo systemctl restart libvirtd
```

Verify:

```bash
virsh net-list --all
ip a show virbr0
```

Expected network:

```
virbr0 → 192.168.122.1/24
```

---

# 3. Create Base Image Cache

Create base image directory:

```bash
sudo mkdir -p /var/lib/libvirt/images/_base
sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/_base
sudo chmod 755 /var/lib/libvirt/images/_base
```

Download Ubuntu 24.04 cloud image:

```bash
sudo wget -O /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
```

Set read-only permissions:

```bash
sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
sudo chmod 444 /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
```

---

# 4. Create VM Directory

```bash
sudo mkdir -p /var/lib/libvirt/images/vms/nat-vm1
sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/nat-vm1
sudo chmod 750 /var/lib/libvirt/images/vms/nat-vm1

cd /var/lib/libvirt/images/vms/nat-vm1
```

---

# 5. Create Overlay Disk from Base Image

```bash
sudo qemu-img create -f qcow2 \
  -F qcow2 \
  -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
  nat-vm1.qcow2 20G
```

Verify backing file:

```bash
sudo qemu-img info nat-vm1.qcow2
```

Expected:

```
backing file: ubuntu-24.04-noble-base.qcow2
```

---

# 6. Create Cloud-Init Configuration

Create user-data file:

```bash
cat | sudo tee user-data.yaml > /dev/null <<EOF
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
```

Create meta-data file:

```bash
cat | sudo tee meta-data.yaml > /dev/null <<EOF
instance-id: nat-vm1
local-hostname: nat-vm1
EOF
```

Create seed ISO:

```bash
sudo cloud-localds -v seed.iso user-data.yaml meta-data.yaml

sudo chown libvirt-qemu:kvm seed.iso user-data.yaml meta-data.yaml
sudo chmod 640 seed.iso user-data.yaml meta-data.yaml
```

---

# 7. Create and Start NAT Virtual Machine

```bash
sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/vms/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/vms/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
```

---

# 8. Get VM IP Address

Method 1:

```bash
sudo virsh net-dhcp-leases default
```

Method 2:

```bash
sudo virsh domiflist nat-vm1
```

Method 3 (debug):

```bash
sudo tcpdump -ni virbr0 port 67 or port 68
```

---

# 9. SSH Into VM

```bash
ssh ubuntu@192.168.122.X
```

Password:

```
1234
```

---

# 10. Useful Management Commands

Start VM:

```bash
sudo virsh start nat-vm1
```

Stop VM:

```bash
sudo virsh shutdown nat-vm1
```

Force stop:

```bash
sudo virsh destroy nat-vm1
```

List VMs:

```bash
sudo virsh list --all
```

Delete VM:

```bash
sudo virsh destroy nat-vm1
sudo virsh undefine nat-vm1
sudo rm -rf /var/lib/libvirt/images/vms/nat-vm1
```

---

# 11. Architecture Overview

```
Host (Ubuntu 24.04)
│
├── libvirtd
├── virbr0 (192.168.122.1 NAT)
│
├── Base Image
│   └── ubuntu-24.04-noble-base.qcow2
│
└── VM Overlay Disk
    └── nat-vm1.qcow2
```

---

# Result

You now have:

* KVM working as hypervisor
* NAT networking configured
* Reusable base image cache
* Efficient VM creation workflow
* Cloud-init automated provisioning

---

# Recommended Repository Structure

```
kvm-lab/
│
├── docs/
│   └── kvm-nat-vm-ubuntu24-cloudinit.md
│
└── README.md
```

---
