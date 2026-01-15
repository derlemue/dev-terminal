# STAGE 1: Asset Source
FROM tsl0922/ttyd:latest AS asset-source

# STAGE 2: Kali Build
FROM kalilinux/kali-rolling:latest
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Dependencies & Tools
RUN apt-get update && apt-get install -y \
    build-essential cmake git libjson-c-dev libwebsockets-dev zlib1g-dev libssl-dev pkg-config \
    zsh zsh-syntax-highlighting zsh-autosuggestions kali-defaults tmux curl vim procps iproute2 ca-certificates openssh-server \
    nodejs npm htop bashtop \
    cryptsetup sudo nano wget docker.io docker-compose traceroute nmap cmatrix \
    dnsutils net-tools iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# 2. Build ttyd from source (with patch)
RUN git clone --branch 1.7.7 --depth 1 https://github.com/tsl0922/ttyd.git /tmp/ttyd \
    && cd /tmp/ttyd/html \
    && sed -i 's/ref={c => (this.container = c as HTMLElement)}/ref={c => { this.container = c as HTMLElement; }}/g' src/components/terminal/index.tsx \
    && sed -i "s/background: '#2b2b2b'/background: 'transparent'/g" src/components/app.tsx \
    && sed -i "s/allowProposedApi: true/allowProposedApi: true, allowTransparency: true/g" src/components/app.tsx \
    && npm install && npm run build \
    && cp /tmp/ttyd/html/dist/inline.html /opt/ttyd_index.html \
    && cd /tmp/ttyd && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make && make install \
    && cd / && rm -rf /tmp/ttyd

# 3. Setup Tools & Shell
RUN curl -L -o /usr/bin/neofetch "https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch" && chmod +x /usr/bin/neofetch

# 4. User Setup (lemue)
RUN useradd -m -s /bin/zsh -G sudo,docker lemue \
    && echo "lemue ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 5. SSH Configuration
RUN mkdir -p /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# 6. Copy Scripts & Assets
COPY overlay.html /opt/overlay.html
COPY welcome.sh /usr/local/bin/welcome.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/welcome.sh /usr/local/bin/entrypoint.sh

# 7. Inject Overlay (Visuals only, Auth handled by ttyd)
RUN cat /opt/overlay.html >> /opt/ttyd_index.html

WORKDIR /home/lemue

EXPOSE 7681 2222
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["ttyd", "-W", "-I", "/opt/ttyd_index.html", "/usr/local/bin/welcome.sh"]
