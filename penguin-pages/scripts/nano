#!/bin/bash
# Usage: sudo ./add_volume.sh /dev/vdb /mnt/mydata
#bash script that will take a device (like /dev/vdb) with
#- Partition it
#- Format it with `ext4`
#- Mount it at a specified directory
#- Add it to `/etc/fstab` so it mounts automatically at reboot

DEVICE=$1
MOUNTPOINT=$2

if [ -z "$DEVICE" ] || [ -z "$MOUNTPOINT" ]; then
    echo "Usage: $0 <device> <mount_point>"
    exit 1
fi

# 1. Check if device exists
if [ ! -b "$DEVICE" ]; then
    echo "Error: Device $DEVICE not found."
    exit 1
fi

# 2. Create partition if not exists
if ! lsblk -no NAME "$DEVICE" | grep -q "${DEVICE##*/}1"; then
    echo "Creating partition on $DEVICE..."
    parted -s "$DEVICE" mklabel gpt
    parted -s "$DEVICE" mkpart primary ext4 0% 100%
    sleep 2
else
    echo "Partition already exists."
fi

PARTITION="${DEVICE}1"

# 3. Format the partition (ext4)
echo "Formatting $PARTITION as ext4..."
mkfs.ext4 -F "$PARTITION"

# 4. Create mount point
mkdir -p "$MOUNTPOINT"

# 5. Mount the partition
mount "$PARTITION" "$MOUNTPOINT"

# 6. Get UUID
UUID=$(blkid -s UUID -o value "$PARTITION")

# 7. Add to /etc/fstab if not already present
if ! grep -q "$UUID" /etc/fstab; then
    echo "UUID=$UUID $MOUNTPOINT ext4 defaults 0 0" >> /etc/fstab
fi

# 8. Verify
mount | grep "$MOUNTPOINT" && echo "Volume mounted successfully at $MOUNTPOINT"

