# STAGE 1: Asset Source
FROM tsl0922/ttyd:latest AS asset-source

# STAGE 2: Kali Build
FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Dependencies
RUN apt-get update && apt-get install -y \
    build-essential cmake git libjson-c-dev libwebsockets-dev zlib1g-dev libssl-dev pkg-config \
    zsh zsh-syntax-highlighting zsh-autosuggestions kali-defaults tmux curl vim procps iproute2 ca-certificates openssh-client \
    nodejs npm htop \
    && rm -rf /var/lib/apt/lists/*

# 2. Build ttyd from source
RUN git clone --branch 1.7.7 --depth 1 https://github.com/tsl0922/ttyd.git /tmp/ttyd \
    && cd /tmp/ttyd/html \
    && sed -i 's/ref={c => (this.container = c as HTMLElement)}/ref={c => { this.container = c as HTMLElement; }}/g' src/components/terminal/index.tsx \
    && npm install && npm run build \
    && cp /tmp/ttyd/html/dist/inline.html /opt/ttyd_index.html \
    && cd /tmp/ttyd && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make && make install \
    && cd / && rm -rf /tmp/ttyd

# 3. Setup Tools & Shell
RUN curl -L -o /usr/bin/neofetch "https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch" && chmod +x /usr/bin/neofetch
RUN cp -r /etc/skel/. /root/ && chsh -s /bin/zsh root

WORKDIR /root

# 4. Copy Files
COPY overlay.html /opt/overlay.html
COPY welcome.sh /usr/local/bin/welcome.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/welcome.sh /usr/local/bin/entrypoint.sh

# 5. DER FIX: INLINE JS INJECTION
# Wir injizieren unser Overlay in das generierte ttyd HTML
RUN cat /opt/overlay.html >> /opt/ttyd_index.html

EXPOSE 7681
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["ttyd", "-W", "-I", "/opt/ttyd_index.html", "/usr/local/bin/welcome.sh"]
