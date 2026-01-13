#!/bin/bash
export TERM=xterm-256color
export LANG=C.UTF-8


# Function to display MOTD
print_motd() {
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

# If called with argument "motd", just print and exit
if [ "$1" = "motd" ]; then
    print_motd
    exit 0
fi

# Main Loop
while true; do
    # Launch tmux and run the welcome script inside it to show MOTD
    # We use 'exec zsh' to keep the shell open after MOTD
    tmux -u new-session -A -s main "zsh -c '/usr/local/bin/welcome.sh motd; exec zsh'"
    
    echo "Session ended. Respawning in 2 seconds..."
    sleep 2
done
