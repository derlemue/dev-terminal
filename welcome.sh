#!/bin/bash
export TERM=xterm-256color
export LANG=C.UTF-8

start_session() {
    clear
    CYAN='\033[0;36m'
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    NC='\033[0m'

    INTERNAL=$(hostname -I | awk '{print $1}')
    PUBLIC=$(curl -s --connect-timeout 1 ifconfig.me || echo "Offline")

    echo -e "${BLUE}--------------------------------------------------------------------------------${NC}"
    /usr/bin/neofetch --ascii_distro Kali --disable packages grep uptime memory
    echo -e "${BLUE}--------------------------------------------------------------------------------${NC}"
    echo -e "  SYSTEM:        ${GREEN}Kali Linux Rolling (Source Build)${NC}"
    echo -e "  STATUS:        ${GREEN}Operational${NC}"
    echo -e "  NET:           Int: ${INTERNAL} | Pub: ${PUBLIC}"
    echo -e "${BLUE}--------------------------------------------------------------------------------${NC}"
    echo -e "\nInitializing interface..."
    sleep 0.5
}

while true; do
    start_session
    tmux -u new-session -A -s main zsh
    echo "Session ended. Respawning in 2 seconds..."
    sleep 2
done
