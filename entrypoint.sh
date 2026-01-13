#!/bin/bash
set -e

# Setup Function for OverlayFS
setup_overlay() {
    local dir=$1
    local lower="/mnt/lower${dir}"
    local upper="/mnt/persistence${dir}_upper"
    local work="/mnt/persistence${dir}_work"

    if [ -d "$dir" ]; then
        mkdir -p "$lower" "$upper" "$work"
        mount --bind "$dir" "$lower"
        mount -t overlay overlay -o lowerdir="$lower",upperdir="$upper",workdir="$work" "$dir"
    fi
}

# Mount persistence image if it exists
if [ -f /persistence.img ]; then
    mkdir -p /mnt/persistence /mnt/lower
    
    # Check if image is formatted, if not try to format (simple check)
    # We rely on user providing formatted image, but fsck is good practice
    # e2fsck -p -f /persistence.img || true

    if ! mountpoint -q /mnt/persistence; then
        echo "Mounting persistence image..."
        mount -o loop /persistence.img /mnt/persistence
    fi

    # List of directories to persist
    # We exclude /etc initially to handle it carefully
    DIRS="/usr /var /root /home /opt"

    for d in $DIRS; do
         setup_overlay "$d"
    done

    # Special handling for /etc due to Docker bind mounts (resolv.conf, etc)
    # We bind mount lower /etc first
    if [ -d /etc ]; then
        mkdir -p /mnt/lower/etc /mnt/persistence/etc_upper /mnt/persistence/etc_work
        mount --rbind /etc /mnt/lower/etc
        
        # Mount overlay on /etc
        mount -t overlay overlay -o lowerdir=/mnt/lower/etc,upperdir=/mnt/persistence/etc_upper,workdir=/mnt/persistence/etc_work /etc
        
        # Restore Docker specific files by rebinding them from the lower layer (where they are visible via rbind)
        for f in resolv.conf hosts hostname; do
            if [ -f "/mnt/lower/etc/$f" ]; then
                touch "/etc/$f"
                mount --bind "/mnt/lower/etc/$f" "/etc/$f"
            fi
        done
    fi

    echo "Persistence enabled for: $DIRS /etc"
fi

# Execute the passed command
exec "$@"
