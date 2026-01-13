# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-01-13
### 🚀 Added
- **Docker Compose:** Initial `docker-compose.yml` for simplified deployment.
- **Overlay Injection:** New build strategy to inject custom secure login overlay directly into `ttyd`'s `inline.html`.
- **SSH Client:** Added `openssh-client` to the Docker image as requested.
- **System Tools:** Added `htop` for system monitoring.
- **Design:** Restored the premium "Glassmorphism" floating terminal design by targeting `ttyd`'s container explicitly in CSS.
- **Layout:** Optimized margin (doubled padding) and hid scrollbars for a cleaner, immersive experience.
- **Documentation:** Added beautiful `README.md` with badges.

### 🐛 Fixed
- **Build Failure:** Resolves missing `inline.js` issue by refactoring build to use `inline.html` from `ttyd` source.
- **TypeScript Error:** Patched `index.tsx` in `ttyd` source (v1.7.7) to resolve build-time TypeScript type mismatch (`RefCallback` void return).
- **Sed Command:** Corrected malformed `sed` command in `Dockerfile`.
- **MOTD Persistence:** Refactored `welcome.sh` to execute the Message of the Day (neofetch) *inside* the tmux session, ensuring it remains visible after session start.

### 🔧 Changed
- **Base Image:** Switched to building `ttyd` from source (tag 1.7.7) ensures stability and allows custom patching.
- **Login UI:** Integrated the custom overlay (glassmorphism style) seamlessly with the `ttyd` terminal.
