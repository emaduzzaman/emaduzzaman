#!/bin/bash
# Usage:
#   sudo ./volume.sh add /dev/vdb /mnt/mydata
#   sudo ./volume.sh remove /mnt/mydata
#   sudo ./volume.sh status
#-----------------------------------------------
#An updated volume.sh script with a new status command that gives you a quick hea#lth check of all mounted volumes and their details.
#It will list all currently mounted volumes with:

#- Device name
#- Mount point
#- Filesystem type
#- Size & usage
#- Whether the mount point is writable (can create and delete a test file)




ACTION=$1
DEVICE=$2
MOUNTPOINT=$3

add_volume() {
    DEVICE=$1
    MOUNTPOINT=$2

    if [ -z "$DEVICE" ] || [ -z "$MOUNTPOINT" ]; then
        echo "Usage: $0 add <device> <mount_point>"
        exit 1
    fi

    if [ ! -b "$DEVICE" ]; then
        echo "Error: Device $DEVICE not found."
        exit 1
    fi

    # Create partition if none exists
    if ! lsblk -no NAME "$DEVICE" | grep -q "${DEVICE##*/}1"; then
        echo "Creating partition on $DEVICE..."
        parted -s "$DEVICE" mklabel gpt
        parted -s "$DEVICE" mkpart primary ext4 0% 100%
        sleep 2
    else
        echo "Partition already exists."
    fi

    PARTITION="${DEVICE}1"

    # Check filesystem
    FSTYPE=$(blkid -s TYPE -o value "$PARTITION")
    if [ -n "$FSTYPE" ]; then
        echo "Filesystem detected: $FSTYPE on $PARTITION"
        read -p "Do you still want to reformat it? (yes/[no]): " CONFIRM
        if [[ "$CONFIRM" != "yes" ]]; then
            echo "Skipping format."
        else
            echo "Formatting $PARTITION as ext4..."
            mkfs.ext4 -F "$PARTITION"
        fi
    else
        echo "No filesystem detected. Formatting $PARTITION as ext4..."
        mkfs.ext4 -F "$PARTITION"
    fi

    mkdir -p "$MOUNTPOINT"
    mount "$PARTITION" "$MOUNTPOINT"

    UUID=$(blkid -s UUID -o value "$PARTITION")
    if ! grep -q "$UUID" /etc/fstab; then
        echo "UUID=$UUID $MOUNTPOINT ext4 defaults 0 0" >> /etc/fstab
    fi

    mount | grep "$MOUNTPOINT" && echo "✅ Volume mounted at $MOUNTPOINT"
}

remove_volume() {
    MOUNTPOINT=$1

    if [ -z "$MOUNTPOINT" ]; then
        echo "Usage: $0 remove <mount_point>"
        exit 1
    fi

    if ! mount | grep -q "on $MOUNTPOINT "; then
        echo "Error: $MOUNTPOINT is not currently mounted."
        exit 1
    fi

    DEVICE=$(findmnt -no SOURCE "$MOUNTPOINT")
    UUID=$(blkid -s UUID -o value "$DEVICE" 2>/dev/null)

    echo "Unmounting $MOUNTPOINT..."
    umount "$MOUNTPOINT" || { echo "Failed to unmount $MOUNTPOINT"; exit 1; }

    if [ -n "$UUID" ]; then
        echo "Removing fstab entry for UUID=$UUID..."
        sed -i.bak "\|UUID=$UUID|d" /etc/fstab
    fi

    if mount | grep -q "$MOUNTPOINT"; then
        echo "❌ $MOUNTPOINT is still mounted."
    else
        echo "✅ $MOUNTPOINT successfully unmounted and removed from fstab."
    fi
}

status_volumes() {
    echo "Mounted volumes and status:"
    echo "--------------------------------------------"
    df -h --output=source,target,fstype,size,used,avail,pcent | tail -n +2 | while read -r src tgt fstype size used avail pcent; do
        # Check writability
        testfile="$tgt/.volume_test_$$"
        if touch "$testfile" 2>/dev/null && rm "$testfile"; then
            writable="Yes"
        else
            writable="No"
        fi
        echo "Device: $src"
        echo "Mount Point: $tgt"
        echo "Filesystem: $fstype"
        echo "Size: $size, Used: $used, Available: $avail, Use%: $pcent"
        echo "Writable: $writable"
        echo "--------------------------------------------"
    done
}

case "$ACTION" in
    add)
        add_volume "$DEVICE" "$MOUNTPOINT"
        ;;
    remove)
        remove_volume "$DEVICE"
        ;;
    status)
        status_volumes
        ;;
    *)
        echo "Usage:"
        echo "  $0 add <device> <mount_point>"
        echo "  $0 remove <mount_point>"
        echo "  $0 status"
        exit 1
        ;;
esac

