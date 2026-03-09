# Phase 1 — Base OS Preparation (5 nodes)
**Explanation**

***What Phase-1 is NOT***
* Not installing Ceph
* Not touching OpenStack
* Not configuring storage pools
* Not performance tuning

***What Phase-1 is***

**Phase-1 is about discipline and consistency across all 5 machines**

Ceph is a distributed system.
Distributed systems break for boring reasons, not fancy ones.

*Most Ceph failures come from:*

* mismatched hostnames
* time drift
* dirty disks

nodes that can’t resolve each other

Phase-1 exists to eliminate those risks before they can hurt you.
## Step 0 — Define inventory on your laptop (so it doesn't mix servers) 

**On the controller laptop**
```
cat > ~/ceph-hosts <<'EOF'
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
EOF

cat ~/ceph-hosts
```

## Step 1 — Make SSH easier (optional but recommended)
**On the controller laptop**
```
cat > ~/.ssh/config <<'EOF'
Host gelani-mon-1
  HostName 192.168.95.19
  User ubuntu

Host gelani-mon-2
  HostName 192.168.95.240
  User ubuntu

Host gelani-mon-3
  HostName 192.168.95.221
  User ubuntu

Host gelani-osd-1
  HostName 192.168.95.105
  User ubuntu

Host gelani-osd-2
  HostName 192.168.95.250
  User ubuntu
EOF

chmod 600 ~/.ssh/config
```
### Test one

```
ssh gelani-mon-1 "hostname; ip -br a | head"
```

## Step 2 — Set correct hostname on each VM
### Now SSH to each VM and set hostname exactly. Run these commands on the corresponding VM:
***gelani-mon-1***
```
sudo hostnamectl set-hostname gelani-mon-1
```
***gelani-mon-2***
```
sudo hostnamectl set-hostname gelani-mon-2
```
***gelani-mon-3***
```
sudo hostnamectl set-hostname gelani-mon-3
```
***gelani-osd-1***
```
sudo hostnamectl set-hostname gelani-osd-1
```
***gelani-osd-2***
```
sudo hostnamectl set-hostname gelani-osd-2
```
***gelani-osd-3***
```
sudo hostnamectl set-hostname gelani-osd-3
```

### Verify Each virtual machine's
```
hostnamectl --static
hostname
```


## Step 3 — Add all cluster host mappings to /etc/hosts (all 5 VMs)
***on each virtual machine***
```
sudo tee -a /etc/hosts >/dev/null <<'EOF'

# Ceph lab nodes (private)
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
EOF

```
### Quick verify on each VM:
```
getent hosts gelani-mon-1 gelani-mon-2 gelani-mon-3 gelani-osd-1 gelani-osd-2
```


## Step 4 — Update OS & install baseline packages (all 5 VMs)
***On each VM:***
```
sudo apt update
sudo apt -y upgrade
sudo apt -y install chrony curl gnupg lsb-release ca-certificates vim nano jq
```
**Note: (chrony = time sync; Ceph really likes stable time)** 


## Step 5 — Configure time sync (chrony) (all 5 VMs)
***On each VM, enable and start:***
```
sudo systemctl enable --now chrony
chronyc tracking
```

## Step 6 — Disable swap (Ceph best practice) (all 5 VMs)
***On each VM:***
```
sudo swapoff -a
sudo sed -i.bak '/\sswap\s/ s/^/#/' /etc/fstab
free -h | grep -i swap
```
**NOTE: Swap should show 0**


## Step 7 — Ensure extra OSD disks are untouched (OSD nodes only)
***On gelani-osd-1 and gelani-osd-2:***
```
lsblk -f
sudo wipefs -n /dev/vdb /dev/vdc /dev/vdd
```
**NOTE: Important: wipefs -n is non-destructive (just shows signatures if any)**


## Step 8 — (Optional) Basic firewall sanity
***At the point of initiation, is this better to don't use the firewall, this can be configured later***
**Check Status of ufw**
```
sudo ufw status verbose
```
**Disable if it is enabled**
```
sudo ufw disable
```

## Phase 1 Done: Final Check (run once per VM)
***On each VM, run:***
```
echo "== $(hostname) ==";
ip -br a | grep -E 'UP|UNKNOWN' | head -n 2;
chronyc tracking | head -n 5;
free -h | grep -i swap
```
---


# Phase-2 — Ceph Bootstrap (cephadm)
***Goal: Create the Ceph cluster brain (MON + MGR) cleanly***

We will:

* Bootstrap Ceph from one MON node
* Let Ceph discover the others
* NOT touch OSD disks yet

## Important Rules for Phase-2

***All commands in this phase are run on gelani-mon-1 ONLY***

* Other nodes must be reachable via SSH
* We do NOT create OSDs yet


## ⚠️ One important thing to do BEFORE Phase-2

### On each VM:
```
sudo reboot
```

### Then reconnect and run this quick check:

```
hostname
uptime
systemctl is-active chrony
free -h | grep -i swap
```

## Step 2.1 — Verify connectivity (quick sanity check)
**On gelani-mon-1:**
```
for h in gelani-mon-1 gelani-mon-2 gelani-mon-3 gelani-osd-1 gelani-osd-2; do
  echo "== $h ==";
  ping -c 1 $h >/dev/null && echo OK || echo FAIL;
done
```
***Expected: all OK***


## Step 2.2 — Install cephadm (bootstrap tool)
***Step 2.2 — Install cephadm (bootstrap tool)***
```
sudo apt update
sudo apt install -y cephadm
```
***Verify:***
```
cephadm version
```
***must see Ceph Quincy related output***


## Step 2.3 — Prepare Ceph config directory
***On gelani-mon-1:***
```
sudo mkdir -p /etc/ceph
sudo chmod 755 /etc/ceph
```
## Step 2.4 — Bootstrap the Ceph cluster (MOST IMPORTANT STEP)
***This is where Ceph is born.***
**Run on gelani-mon-1:**
```
sudo cephadm bootstrap \
  --mon-ip 192.168.95.19 \
  --cluster-network 192.168.95.0/24 \
  --ssh-user ubuntu \
  --initial-dashboard-user admin \
  --initial-dashboard-password 'Ceph@123'
```

### What this does (plain English):

* Creates the first MON
* Creates the first MGR
* Enables Ceph Dashboard
* Generates SSH keys for cluster control
* Stores Ceph configs securely

***This takes 2–4 minutes***


## Step 2.5 - install ceph cli on the host
```
sudo apt update && sudo apt install -y ceph-common
```

## Step 2.6 - ceph without sudo (key permission create)
```
sudo usermod -aG ceph ubuntu
sudo chgrp -R ceph /etc/ceph
sudo chmod 750 /etc/ceph
sudo chmod 640 /etc/ceph/ceph.client.admin.keyring /etc/ceph/ceph.conf
newgrp ceph
```

## Step 2.7 - Make sure ceph there is no issue regurading authertication
### view cephadm public key
```
sudo cat /etc/ceph/ceph.pub
```
### Add key to gelani-mon-2
```
sudo ssh-copy-id -f -i /etc/ceph/ceph.pub ubuntu@192.168.95.240
```
### 