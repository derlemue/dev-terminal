#!/bin/bash
# 🟢 LEMUE // DEV-TERMINAL SETUP V2.0.17
set -e

echo ""
echo "██████╗ ███████╗██╗   ██╗     ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     "
echo "██╔══██╗██╔════╝██║   ██║     ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     "
echo "██║  ██║█████╗  ██║   ██║_____   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     "
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝_____|  ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     "
echo "██████╔╝███████╗ ╚████╔╝         ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗"
echo "╚═════╝ ╚══════╝  ╚═══╝          ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝"
echo "                                                              System Init v2.0.29"
echo ""

# 1. Check for .env
if [ ! -f .env ]; then
    echo "[SETUP] No .env file found. Creating from default..."
    cp .env.example .env
    echo "[NOTE]  Default credentials loaded. Edit .env to secure your instance."
else
    echo "[CHECK] Configuration (.env) found."
fi

# 2. Check for Persistence Image
if [ ! -f persistence.img ]; then
    if [ -d persistence.img ]; then
        echo "[WARN]  'persistence.img' is a DIRECTORY (Docker auto-create error)."
        echo "[FIX]   Removing directory..."
        sudo rm -rf persistence.img
    fi
    
    echo "[SETUP] Generating 4GB Encrypted Volume (persistence.img)..."
    echo "        Depending on your disk speed, this may take a moment."
    dd if=/dev/zero of=persistence.img bs=1M count=4096 status=progress
    echo "[DONE]  Volume created successfully."
else
    echo "[CHECK] Persistence volume found."
fi

# 3. Launch
echo "[INIT]  Building and Launching Container (Forced Rebuild)..."
sudo docker compose down 2>/dev/null || true
sudo docker compose build --no-cache
sudo docker compose up -d

echo ""
echo "🟢 SYSTEM OPERATIONAL"
echo "   > WEB: http://localhost:7681"
echo "   > SSH: ssh -p 2222 lemue@localhost"
echo ""
