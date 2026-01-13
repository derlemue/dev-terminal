<div align="center">

![Terminal Preview](docs/terminal_preview.png)

# 🟢 **LEMUE // DEV-TERMINAL** `v1.0.2-alpha`

![License](https://img.shields.io/github/license/derlemue/dev-terminal?style=for-the-badge&labelColor=black&color=00ff41)
![Docker](https://img.shields.io/badge/docker-ready-black?style=for-the-badge&logo=docker&logoColor=00ff41)
![Status](https://img.shields.io/badge/status-ONLINE-black?style=for-the-badge&color=00ff41)
![Security](https://img.shields.io/badge/security-HARDENED-black?style=for-the-badge&logo=kalilinux&logoColor=00ff41)

**[ SYSTEM_ROOT_ACCESS // ESTABLISHED ]**
**[ UPLINK // SECURE_TTY_OVER_HTTPS ]**

[ > INITIATE_SEQUENCE ](#-installation) • [ > VIEW_SPECS ](#-features) • [ > SYSTEM_LOGS ](#-changelog)

</div>

---

## 📟 SYSTEM_OVERVIEW

**The Construct is ready.**
Lemue Dev-Terminal provides a high-fidelity, WebGL-accelerated neural interface (tty) directly into a Kali Linux kernel. Housed within a Docker containment unit, it features a glass-paneled, transparent overlay aesthetic, delivering a pure cyberpunk root shell experience.

## 💾 FEATURE_SET

- ** > [ SECURE_UPLINK ]**: Code-locked overlay protection. Passkey: `1337`.
- ** > [ NEURAL_INTERFACE ]**: 75% Transparency Glassmorphism console. Floating viewport.
- ** > [ KERNEL_CORE ]**: Kali Linux Rolling. Pre-loaded: `git`, `vim`, `tmux`, `zsh`, `htop`, `openssh`.
- ** > [ PERSISTENCE_DRIVE ]**: 512MB OverlayFS storage mounting `/usr`, `/root`, `/opt`. Tools survive reboot.
- ** > [ ZERO_LATENCY ]**: WebGL acceleration via Xterm.js.

## 🔌 DEPLOYMENT_PROTOCOL

### [ PREREQUISITES ]
- Docker Algorithm
- Git Version Control

### [ EXECUTE_SEQUENCE ]
```bash
# Clone the repository
git clone https://github.com/derlemue/dev-terminal.git
cd dev-terminal

# Generate Persistence Core (512MB)
dd if=/dev/zero of=persistence.img bs=1M count=512
mkfs.ext4 persistence.img

# Initialize Construct
sudo docker compose up -d --build
```

** > ACCESS_POINT:** [`http://localhost:7681`](http://localhost:7681)

## 🕹️ OPERATOR_MANUAL

1. Jack in to `http://localhost:7681`.
2. Authenticate: `1337`.
3. You are **ROOT**.

## 🏗️ SYSTEM_ARCHITECTURE

The matrix is built on three layers:
1.  **Source Code:** `ttyd` (v1.7.7-patched) compiled from raw source with custom transparency injection.
2.  **Visual Layer:** HTML/CSS Injection for "Matrix" glassmorphism.
3.  **Base Reality:** Kali Linux Rolling.

---
<div align="center">
[ END_OF_LINE ]<br>
Crafted by <a href="https://github.com/derlemue">Lemue</a>
</div>
