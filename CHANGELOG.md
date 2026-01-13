# Changelog

All notable changes to this project will be documented in this file.

## [1.0.3-alpha] - 2026-01-13
### 🚀 [ MATRIX_EVOLUTION // CONSOLIDATED ]
- **[ NEURAL_VISUALS ]**: Opacity calibrated to **80%** with glass-blur reinforced.
- **[ TRUE_TRANSPARENCY ]**: `ttyd` source patched to render fully transparent background, eliminating the black void.
- **[ SSH_UPLINK ]**: Port `22` Exposed for remote shell access.
- **[ DOCUMENTATION ]**: Updated Screenshots and Manual.

## [1.0.2-alpha] - 2026-01-13
### 🚀 [ MATRIX_EVOLUTION // INVISIBLE_CONTAINER ]
- ** > [ NULL_CONTAINER ]**: Container box rendered invisible (`background: transparent`, `border: none`).
- ** > [ PURE_TEXT ]**: Terminal appears to float freely in the Construct.
- ** > [ DIMENSIONS ]**: Maintained 75% scale.
- ** > [ VISUAL_CLARITY ]**: 75% opacity verified.

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
