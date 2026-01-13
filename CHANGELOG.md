# Changelog

All notable changes to this project will be documented in this file.

## [1.0.2-alpha] - 2026-01-13
### 🚀 [ MATRIX_EVOLUTION // ITERATION_75 ]
- ** > [ NEURAL_INTERFACE ]**: Viewport dimensions adjusted to **75%** scale (75vw / 75vh).
- ** > [ VISUAL_CLARITY ]**: Opacity calibrated to **75%** (Layer 0.75).
- ** > [ TERMINAL_CORE ]**: Synced transparency across container and viewport.

## [1.0.1-alpha] - 2026-01-13
### 🚀 [ SYSTEM_UPGRADE // INITIATED ]
- ** > [ DOCKER_CORE ]**: Initialized `docker-compose.yml` for rapid deployment sequence.
- ** > [ SECURITY_OVERLAY ]**: Injection strategy active. Custom login overlay integrated directly into `ttyd` binary assets.
- ** > [ SSH_UPLINK ]**: `openssh-client` module loaded.
- ** > [ SYSTEM_MONITORING ]**: `htop` process viewer verified.
- ** > [ NEURAL_AESTHETIC ]**: Matrix-style glassmorphism restored. Floating viewport centered.
- ** > [ VISUAL_CLARITY ]**: Opacity set to 60%. Scrollbars purged for immersion.
- ** > [ PERSISTENCE_LAYER ]**: OverlayFS enabled. `/root`, `/usr`, `/opt` preserved across reboots.
- ** > [ IDENTITY_PROTOCOL ]**: Hostname set to `dev-terminal`.
- ** > [ MANUAL ]**: `README.md` recompiled with advanced styling.

### 🐛 Fixed
- **Build Failure:** Resolves missing `inline.js` issue by refactoring build to use `inline.html` from `ttyd` source.
- **TypeScript Error:** Patched `index.tsx` in `ttyd` source (v1.7.7) to resolve build-time TypeScript type mismatch (`RefCallback` void return).
- **Sed Command:** Corrected malformed `sed` command in `Dockerfile`.
- **MOTD Persistence:** Refactored `welcome.sh` to execute the Message of the Day (neofetch) *inside* the tmux session, ensuring it remains visible after session start.

### 🔧 Changed
- **Base Image:** Switched to building `ttyd` from source (tag 1.7.7) ensures stability and allows custom patching.
- **Login UI:** Integrated the custom overlay (glassmorphism style) seamlessly with the `ttyd` terminal.
