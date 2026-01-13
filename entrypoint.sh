#!/bin/bash
set -e

# --- Configuration ---
PERSISTENCE_IMG="/persistence.img"
MOUNT_POINT="/mnt/persistence"
MAPPER_NAME="dev-terminal-crypt"

echo "[INIT] Dev-Terminal v2.0.0 (Encrypted Persistence)"

# --- 1. Encryption & Persistence Setup ---
if [ -f "$PERSISTENCE_IMG" ]; then
    if [ -z "$ENCRYPTION_PASS" ]; then
        echo "[ERROR] ENCRYPTION_PASS not set! Cannot open persistence."
        # Fallback? No, security first.
        # But for first run without img, we proceed?
        # The image must exist (volume map).
        exit 1
    fi

    echo "[INIT] Checking persistence image..."
    
    # Cleanup: Force close any existing mapper (fix for restart loops)
    echo "[INIT] Ensuring clean state for $MAPPER_NAME..."
    cryptsetup luksClose "$MAPPER_NAME" 2>/dev/null || true
    
    # Check if LUKS header exists
    if ! cryptsetup isLuks "$PERSISTENCE_IMG"; then
        echo "[INIT] No LUKS header found. Initializing NEW encrypted volume..."
        echo -n "$ENCRYPTION_PASS" | cryptsetup luksFormat -q "$PERSISTENCE_IMG" -
    fi

    echo "[INIT] Opening encrypted volume..."
    echo -n "$ENCRYPTION_PASS" | cryptsetup luksOpen "$PERSISTENCE_IMG" "$MAPPER_NAME" -

    # Check for valid filesystem
    if ! blkid "/dev/mapper/$MAPPER_NAME" | grep -q "TYPE=\"ext4\""; then
        echo "[INIT] No Valid Filesystem found on volume. Formatting ext4..."
        mkfs.ext4 "/dev/mapper/$MAPPER_NAME"
    else
        echo "[INIT] Filesystem verified."
    fi

    # Mount
    mkdir -p "$MOUNT_POINT"
    mount "/dev/mapper/$MAPPER_NAME" "$MOUNT_POINT"
    echo "[INIT] Encrypted volume mounted at $MOUNT_POINT"

    # OverlayFS Setup
    # Prepare Upper/Work dirs
    for dir in usr var root home opt; do
        UPPER="$MOUNT_POINT/upper/$dir"
        WORK="$MOUNT_POINT/work/$dir"
        mkdir -p "$UPPER" "$WORK"
        echo "[INIT] Overlaying /$dir..."
        mount -t overlay overlay -o lowerdir=/$dir,upperdir=$UPPER,workdir=$WORK /$dir
    done

    # Handling /etc safely regarding Docker internals
    # We skip full /etc overlay for simplicity in this version to guarantee DNS works,
    # OR we apply the bind-mount trick again.
    # User asked for "Persist /".
    # Let's apply the bind-mount trick for /etc again as it was robust.
    
    mkdir -p /mnt/lower_etc "$MOUNT_POINT/upper/etc" "$MOUNT_POINT/work/etc"
    mount --rbind /etc /mnt/lower_etc
    mount -t overlay overlay -o lowerdir=/mnt/lower_etc,upperdir=$MOUNT_POINT/upper/etc,workdir=$MOUNT_POINT/work/etc /etc
    for f in resolv.conf hosts hostname; do
        if [ -f "/mnt/lower_etc/$f" ]; then
            touch "/etc/$f"
            mount --bind "/mnt/lower_etc/$f" "/etc/$f"
        fi
    done
    echo "[INIT] Overlaying /etc (DNS preserved)..."

    # Ensure correct ownership for user 'lemue'
    chown -R lemue:lemue /home/lemue
fi

# --- 2. Service Startup ---

# Start SSH
echo "[INIT] Starting SSH Server on port 2222..."
service ssh start

# Start TTYD
echo "[INIT] Starting TTYD..."

# Use Basic Auth if configured
AUTH_ARGS=""
if [ -n "$WEB_USER" ] && [ -n "$WEB_PASS" ]; then
    echo "[INIT] Enabling Basic Auth for user: $WEB_USER"
    AUTH_ARGS="-c $WEB_USER:$WEB_PASS"
fi

exec ttyd $AUTH_ARGS -P 30 -W -t theme='{"background":"transparent", "foreground":"#ffffff"}' -I /opt/ttyd_index.html su - lemue -c "/usr/local/bin/welcome.sh"
