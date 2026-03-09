#!/bin/bash
# Usage: sudo ./remove_volume.sh /mnt/mydata
#THis script will 
#- Unmount the volume
#- Remove its `/etc/fstab` entry (by UUID)
#- Confirm it’s unmounted


MOUNTPOINT=$1

if [ -z "$MOUNTPOINT" ]; then
    echo "Usage: $0 <mount_point>"
    exit 1
fi

# 1. Check if mount point exists
if ! mount | grep -q "on $MOUNTPOINT "; then
    echo "Error: $MOUNTPOINT is not currently mounted."
    exit 1
fi

# 2. Get the device/UUID
DEVICE=$(findmnt -no SOURCE "$MOUNTPOINT")
UUID=$(blkid -s UUID -o value "$DEVICE" 2>/dev/null)

echo "Unmounting $MOUNTPOINT..."
umount "$MOUNTPOINT" || { echo "Failed to unmount $MOUNTPOINT"; exit 1; }

# 3. Remove from /etc/fstab if present
if [ -n "$UUID" ]; then
    echo "Removing fstab entry for UUID=$UUID..."
    sed -i.bak "\|UUID=$UUID|d" /etc/fstab
else
    echo "No UUID found for $DEVICE, skipping fstab cleanup."
fi

# 4. Confirm unmount
if mount | grep -q "$MOUNTPOINT"; then
    echo "❌ $MOUNTPOINT is still mounted."
else
    echo "✅ $MOUNTPOINT successfully unmounted and removed from fstab."
fi

