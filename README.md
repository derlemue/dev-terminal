<div align="center">

![Logo](https://raw.githubusercontent.com/derlemue/assets/refs/heads/main/avatars/lemueIO/flyer/lemueIO-flyer-4.png)

# 🔐 Lemue Dev-Terminal

![License](https://img.shields.io/github/license/derlemue/dev-terminal?style=for-the-badge&color=blue)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=for-the-badge&logo=docker)
![Status](https://img.shields.io/badge/status-operational-success?style=for-the-badge)
![Security](https://img.shields.io/badge/security-hardened-red?style=for-the-badge&logo=kalilinux)

**High-Performance, Secure Web Token Terminal based on TTYD & Kali Linux**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Changelog](#-changelog)

</div>

---

## 🚀 Overview
**Lemue Dev-Terminal** is a secure, browser-based terminal solution designed for rapid deployment and accessibility. Built on top of `ttyd` and `Kali Linux Rolling`, it provides a full-featured shell environment accessible from any modern web browser, protected by a custom security overlay.

## ✨ Features
- **🛡️ Secure Entry:** Custom CSS/JS Overlay requiring a passcode (`1337`) to access the terminal.
- **⚡ High Performance:** WebGL-accelerated terminal rendering via Xterm.js.
- **🔧 Kali Rolling:** Full Kali Linux ecosystem pre-installed (git, vim, tmux, zsh).
- **🐳 Dockerized:** One-click deployment with Docker Compose.
- **🎨 Custom UI:** Beautiful, responsive interface with custom background and glassmorphism effects.

## 📦 Installation

### Prerequisites
- Docker & Docker Compose
- Git

### Quick Start
```bash
# Clone the repository
git clone https://github.com/derlemue/dev-terminal.git
cd dev-terminal

# Start the container
sudo docker compose up -d --build
```
Access the terminal at `http://localhost:7681`.

## 🛠️ Usage
1. Open your browser and navigate to `http://localhost:7681`.
2. Enter the passkey: `1337`
3. Enjoy your root shell.

## 🏗️ Architecture
The project uses a multi-stage Docker build to:
1. Compile `ttyd` (v1.7.7-patched) from source directly.
2. Inject a custom HTML overlay into `ttyd`'s bundled assets.
3. Deploy on a lightweight Kali Linux base image.

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

---
<div align="center">
Made with ❤️ by <a href="https://github.com/derlemue">Lemue</a>
</div>
