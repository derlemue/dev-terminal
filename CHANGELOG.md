# Changelog

All notable changes to this project will be documented in this file.

## [2.0.5] - 2026-01-13
### 🚀 [ FEATURE // INTELLIGENCE ]
- **[ VIDEO_FEED ]**: Added HTML5 Video Player for `terminal.mp4` log visualization.

## [2.0.4] - 2026-01-13
### 🐛 [ PATCH // DOCS ]
- **[ REMOVAL ]**: Temporarily removed Audio Log link (asset pending).

## [2.0.3] - 2026-01-13
### 🐛 [ PATCH // DEPENDENCIES ]
- **[ PACKAGE_FIX ]**: Replaced `docker-compose-plugin` (missing in repo) with `docker-compose`.

## [2.0.2] - 2026-01-13
### 🐛 [ PATCH // CONFIGURATION ]
- **[ YAML_FIX ]**: Resolved duplicate `ports` definition in `docker-compose.yml` blocking build.

## [2.0.1] - 2026-01-13
### 🐛 [ PATCH // DOCUMENTATION ]
- **[ FORMATTING ]**: Corrected markdown rendering for Access Point and SSH Uplink section.

## [2.0.0] - 2026-01-13
### 🚀 [ SYSTEM_OVERHAUL // PRODUCTION_READY ]
- **[ ENCRYPTED_PERSISTENCE ]**: Implemented **LUKS** encryption for the 2GB persistent layer. Data is secured at rest via `cryptsetup`. Keys managed via `.env`.
- **[ SECURE_AUTHENTICATION ]**: Transitioned from client-side JS checks to server-side **Basic Auth** (`ttyd -c`). Credentials (`WEB_USER`, `WEB_PASS`) managed via `.env`.
- **[ TOOL_ARSENAL ]**: Pre-installed extensive suite: `nmap`, `docker.io`, `ssh-server`, `cryptsetup`, `tracepath`, `bashtop`, `dnsutils`, `net-tools`, `iproute2`.
- **[ SYSTEM_USER ]**: Created dedicated user `lemue` with `sudo` and `docker` privileges.
- **[ SSH_EXPANSION ]**: SSH Daemon running on port `2222` with `PermitRootLogin` enabled for deep system access.
- **[ NEURAL_TRAINING ]**: Added integration for Quizzes and Flashcards.
- **[ INTELLIGENCE_LOG ]**: Added Web Player for Audio Logs and Classified Report viewers.
- **[ STORAGE_UPGRADE ]**: Persistence partition size standardized to **2GB** (2048MB).

## [1.0.6-alpha] - 2026-01-13
### 🚀 [ VISUAL_TUNING // PURE_TINT ]
- **[ BORDERLESS ]**: Removed container borders and shadows ("The Box") to achieve a pure floating terminal aesthetic.
- **[ OPACITY_70 ]**: Maintained 70% background tint for contrast without the visual weight of a container frame.

## [1.0.5-alpha] - 2026-01-13
### 🚀 [ VISUAL_TUNING // OPACITY_70 ]
- **[ TRANSLUCENCY ]**: Shell background opacity reduced to **70%** (Layer 0.70) for enhanced background visibility.
- **[ AESTHETIC ]**: Fine-tuned glass-blur balance.

## [1.0.4-alpha] - 2026-01-13
### 🚀 [ SYSTEM_ADJUSTMENT // TEMPORAL_ALIGNMENT ]
- **[ TIME_SYNCHRONIZATION ]**: Docker container time zone set to `Europe/Amsterdam`.
- **[ ENVIRONMENT ]**: `TZ` variable injected via `docker-compose.yml`.

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
