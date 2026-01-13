#!/bin/bash
set -e

# Mount persistence image if it exists and is not already mounted
if [ -f /persistence.img ]; then
    mkdir -p /root/persistence
    
    # Check if mounted
    if ! mountpoint -q /root/persistence; then
        echo "Mounting persistence image..."
        mount -o loop /persistence.img /root/persistence
        
        # Correct permissions
        chmod 755 /root/persistence
    fi
fi

# Execute the passed command (ttyd)
exec "$@"
