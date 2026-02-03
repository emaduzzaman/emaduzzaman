# OpenStack & Ceph Command Reference

---

## Authentication

```bash
source /opt/stack/devstack/openrc admin admin  # Load OpenStack admin credentials into shell

openstack token issue                           # Check if your auth token is valid
```

---

## Server (Nova) Commands

```bash
openstack server list                           # List all servers in OpenStack

openstack server list --name ceph-vm            # List servers filtered by name

openstack server list --status ERROR            # List all servers in ERROR state

openstack server create \
  --flavor m1.small \
  --network private \
  --volume my-boot-vol \
  my-vm                                         # Create a server booting from an existing Ceph volume

openstack server create \
  --flavor m1.small \
  --network private \
  --boot-from-volume 5 \
  --image ubuntu \
  my-vm                                         # Create a server booting from a new volume created from an image

openstack server show my-vm                     # Show full details of a server

openstack server show my-vm \
  -c status \
  -c OS-EXT-STS:vm_state \
  -c OS-EXT-STS:task_state                      # Show only status and VM/task state of a server

openstack server show my-vm \
  -c fault \
  -c status \
  -c OS-EXT-STS:vm_state \
  -c OS-EXT-STS:task_state                      # Show server status along with any fault details

openstack server show my-vm -c OS-EXT-SRV-ATTR:host  # Show which hypervisor/host the server is on

openstack server event list my-vm               # List all events (build, migrate, etc.) for a server

openstack server event show my-vm <request-id>  # Show details of a specific server event by request ID

openstack console log show my-vm                # Show the console/boot log output of a server

openstack server stop my-vm                     # Stop a running server

openstack server delete my-vm                   # Delete a server

openstack server list -f value -c ID | while read id; do
  openstack server delete "$id"
done                                            # Delete all servers in bulk
```

---

## Volume (Cinder) Commands

```bash
openstack volume list                           # List all volumes

openstack volume list --long                    # List all volumes with extra details

openstack volume list --status error            # List volumes that are in error state

openstack volume list --name my-vol             # List volumes filtered by name

openstack volume show my-vol                    # Show full details of a volume

openstack volume show my-vol \
  -c status -c attachments -c type \
  -c os-vol-host-attr:host                      # Show volume status, attachments, type, and host

openstack volume create --type ceph --size 2 my-vol  # Create a new empty Ceph volume

openstack volume create \
  --image my-image \
  --type ceph \
  --size 8 \
  my-boot-vol                                   # Create a bootable Ceph volume from an image

openstack volume set --state error <vol-id>     # Manually set a volume state to error (useful before force-delete)

openstack volume delete my-vol                  # Delete a volume

openstack volume delete --force <vol-id>        # Force delete a volume (even if in use or stuck)

openstack volume delete --cascade <vol-id>      # Delete a volume and all its snapshots

openstack volume snapshot create my-snap \
  --volume <vol-id>                             # Create a snapshot of a volume

openstack volume snapshot list                  # List all volume snapshots

openstack volume snapshot list --volume <vol-id>  # List snapshots for a specific volume

openstack volume service list                   # List all Cinder volume services and their status

openstack volume type list                      # List all available volume types

openstack volume type show ceph                 # Show details and properties of the ceph volume type

openstack quota show admin                      # Show current resource quotas for admin user

openstack quota set \
  --volumes 50 \
  --gigabytes 1000 \
  admin                                         # Set volume and storage quotas for admin user
```

---

## Image (Glance) Commands

```bash
openstack image list                            # List all images

openstack image list --public                   # List only public images

openstack image show <image-id> \
  -c name -c status -c size -c properties       # Show image details including properties

openstack image create my-image \
  --file /path/to/image.img \
  --disk-format qcow2 \
  --container-format bare \
  --public                                      # Upload a new image from a local file

openstack image create my-image \
  --disk-format qcow2 \
  --container-format bare \
  --public                                      # Create an empty image entry (for two-step upload)

openstack image stage my-image \
  --file /path/to/image.img                     # Upload the image data (step 2 of two-step upload)

openstack image import my-image \
  --method glance-direct \
  --wait                                        # Import/finalize image using glance-direct method

openstack image delete my-image                 # Delete an image
```

---

## Network (Neutron) Commands

```bash
openstack network list                          # List all networks

openstack subnet show <subnet-id> \
  -c network_id -c name -f yaml                 # Show subnet details in YAML format
```

---

## Flavor & Compute Commands

```bash
openstack flavor list                           # List all available flavors

openstack compute service list                  # List all Nova compute services and their status

openstack hypervisor list                       # List all hypervisors
```

---

## Ceph Commands

```bash
ceph -s                                         # Show Ceph cluster status overview

sudo ceph osd pool ls                           # List all Ceph OSD pools

sudo ceph osd pool ls | grep -E "images|volumes|vms"  # Check if images/volumes/vms pools exist

sudo ceph auth get client.cinder                # Show the auth key for client.cinder

sudo ceph auth get client.glance                # Show the auth key for client.glance

sudo ceph auth get-key client.cinder            # Get only the base64 key for client.cinder

sudo ceph auth get-or-create client.glance \
  mon 'profile rbd' \
  osd 'profile rbd pool=images' \
  -o /etc/ceph/ceph.client.glance.keyring       # Create or retrieve auth for client.glance and save keyring

sudo ceph auth del client.glance                # Delete the client.glance auth entry
```

---

## RBD (RADOS Block Device) Commands

```bash
rbd -p volume ls                                # List all RBD images in the volume pool

rbd -p images ls                                # List all RBD images in the images pool

rbd -p volume ls | grep <vol-id>                # Find a specific volume in Ceph by its UUID

rbd info volume/volume-<vol-id>                 # Show detailed info of an RBD image

rbd showmapped                                  # Show currently mapped RBD devices

rbd snap ls volume/volume-<vol-id>              # List all snapshots of an RBD image

rbd snap purge volume/volume-<vol-id>           # Delete all snapshots of an RBD image

rbd snap unprotect volume/volume-<vol-id>@snap  # Unprotect a snapshot (required before deleting)

rbd snap rm volume/volume-<vol-id>@snap         # Delete a specific snapshot

rbd rm volume/volume-<vol-id>                   # Remove an RBD image from Ceph

sudo rbd -p volume ls \
  --id cinder \
  --keyring /etc/ceph/ceph.client.cinder.keyring  # List volumes using explicit cinder credentials
```

---

## Libvirt / Virsh Commands

```bash
sudo virsh list --all                           # List all VMs (running and stopped) in libvirt

sudo virsh -c qemu:///system list --all         # Same as above using explicit QEMU connection

sudo virsh -c qemu:///system dumpxml <vm-name>  # Dump the full XML config of a VM

sudo virsh -c qemu:///system dumpxml <vm> \
  | egrep "rbd|ceph|secret|pool|auth"           # Check Ceph/RBD related config inside a VM

sudo virsh -c qemu:///system secret-define \
  --file /tmp/ceph-secret.xml                   # Define a libvirt secret from an XML file

sudo virsh -c qemu:///system secret-set-value \
  --secret <uuid> \
  --base64 "<key>"                              # Set the value of a libvirt secret

sudo virsh -c qemu:///system secret-list        # List all defined libvirt secrets
```

---

## File & Permission Commands (Ceph Keyrings)

```bash
sudo chown root:stack /etc/ceph/ceph.client.glance.keyring  # Set ownership for Glance keyring

sudo chown root:libvirt /etc/ceph/ceph.client.cinder.keyring  # Set ownership for Cinder keyring

sudo chmod 640 /etc/ceph/ceph.client.*.keyring  # Restrict keyring read to owner + group

sudo chmod 644 /etc/ceph/ceph.conf              # Make ceph.conf readable by everyone
```

---

## Log & Debug Commands

```bash
sudo journalctl -u devstack@n-cpu -n 200 --no-pager  # Show last 200 lines of Nova Compute logs

sudo journalctl -u devstack@c-vol -n 200 --no-pager  # Show last 200 lines of Cinder Volume logs

sudo journalctl -u devstack@g-api -n 200 --no-pager  # Show last 200 lines of Glance API logs

sudo journalctl -fu devstack@g-api              # Follow (live) Glance API logs in real time

sudo journalctl -u devstack@n-cpu \
  --since "20 minutes ago" --no-pager \
  | egrep -i "error|exception|rbd|ceph" \
  | tail -n 200                                 # Filter Nova compute logs for errors/Ceph issues

sudo tail -n 200 /var/log/libvirt/qemu/*.log    # Show recent libvirt/QEMU VM logs

sudo tail -n 200 /var/log/apache2/error.log     # Show recent Apache error logs

sudo systemctl status devstack@g-api --no-pager # Show current status of the Glance API service

sudo systemctl status devstack@n-cpu --no-pager # Show current status of the Nova Compute service
```

---

## Service Restart Commands

```bash
sudo systemctl restart devstack@n-cpu           # Restart Nova Compute service

sudo systemctl restart devstack@c-vol           # Restart Cinder Volume service

sudo systemctl restart devstack@g-api           # Restart Glance API service

sudo systemctl restart libvirtd                 # Restart the libvirt daemon

sudo systemctl restart apache2                  # Restart Apache (used as proxy for OpenStack APIs)

sudo systemctl restart ceph-mon@$(hostname)     # Restart the Ceph monitor on current host
```

---

## Misc / Utility Commands

```bash
sudo ss -ltnp | egrep ':9292|:80'               # Check if Glance (9292) and Apache (80) are listening

sudo ufw status verbose                         # Show UFW firewall status and rules

sudo ufw disable                                # Disable UFW firewall

sudo ufw allow 80/tcp                           # Allow HTTP traffic through firewall

which rbd                                       # Check if rbd command is installed

rbd --version                                   # Show RBD client version

sudo ls /var/lib/nova/instances                 # List Nova instance directories on the host

id libvirt-qemu                                 # Show UID/GID info for libvirt-qemu user

id nova                                         # Show UID/GID info for nova user
```