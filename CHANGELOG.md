# Changelog

All notable changes to this project will be documented in this file.

## [2.0.25] - 2026-01-14
### 🎨 [ PATCH // UI_TWEAK ]
- **[ MARGINS ]**: Reduced Container size to 80vw/80vh (effectively 10% margin on all sides).
- **[ PADDING ]**: Increased internal padding to 50px.
- **[ OPACITY ]**: Reduced background opacity to 50% (`0.5`) for greater transparency.

## [2.0.24] - 2026-01-14
### 🐞 [ PATCH // DOCS_FIX ]
- **[ README ]**: Fixed missing link for `info-2.html` and removed duplicate header.

## [2.0.23] - 2026-01-14
### 📄 [ FEATURE // DOCUMENTATION ]
- **[ INTEL_LINK ]**: Added `docs/info-2.html` (TRON Forensics Report) to README Intelligence Data.

## [2.0.22] - 2026-01-14
### ✨ [ PATCH // UI_MILESTONE ]
- **[ GLASSMORPHISM ]**: Implemented "Glass Box" style.
    - Size: 90% Width / 90% Height.
    - Background: 80% Opacity Black (`rgba(0,0,0,0.8)`).
    - Effect: Backdrop Blur (10px).
    - Border: Thin distinct border + Rounded Corners (16px).
    - Shadow: Deep box-shadow for "floating" effect.

## [2.0.21] - 2026-01-14
### 🎨 [ PATCH // UI_FIX ]
- **[ FULLSCREEN ]**: Forced Terminal to 100vw/100vh with transparency.
- **[ CSS_OVERRIDE ]**: Added recursive background removal to fix "Black Box" issue.
- **[ INSTALL_FIX ]**: `setup.sh` now enforces `--no-cache` to ensure UI updates are applied.

## [2.0.20] - 2026-01-14
### 🎨 [ PATCH // UI_POLISH ]
- **[ GLASS_MODE ]**: Removed background container "box". Terminal text now floats directly on the wallpaper.
- **[ READABILITY ]**: Added heavy text-shadow to ensure visibility against the background.
- **[ LAYOUT ]**: Increased terminal size to 95vw/90vh and centered it perfectly.

## [2.0.19] - 2026-01-14
### 🔒 [ FEATURE // SECURE_SHUTDOWN ]
- **[ LOCK_COMMAND ]**: Added `lock` alias (executes `sudo poweroff`) to safely shutdown and re-encrypt the volume.
- **[ RESTART_POLICY ]**: Changed to `restart: no`. "Exit" now means "Stay Down" (Secure).

## [2.0.18] - 2026-01-14
### 🐛 [ PATCH // CRITICAL_FIX ]
- **[ TTYD_CONFIG ]**: Removed malformed `-t enable-sixel` option which caused boot loop.
- **[ STABILITY ]**: Restored system stability.

## [2.0.17] - 2026-01-13
### 🚀 [ FEATURE // AUTOMATION ]
- **[ SETUP_SCRIPT ]**: Added `./setup.sh` to automate environment checks, volume creation, and docker launch.
- **[ DOCKERFILE ]**: Applied SSH password setting (`lemue:lemue`) and forced expiry (`chage -d 0`) for real.

## [2.0.16] - 2026-01-13
### 🔒 [ PATCH // SECURITY_HARDENING ]
- **[ ENFORCED_RESET ]**: Forced password change on first login (Web & SSH).
- **[ USER_CONFIG ]**: Verified `lemue` permissions: Passwordless Sudo + Docker access confirmed.

## [2.0.15] - 2026-01-13
### 🐛 [ PATCH // MOBILE_STABILITY ]
- **[ KEEPALIVE ]**: Added `-P 30` (Ping Interval) to `ttyd` to prevent Mobile Safari from killing the connection.
- **[ USER_CONTEXT ]**: Enforced `su - lemue` context switch for Web Terminal (previously reverted/failed).

## [2.0.14] - 2026-01-13
### 🔒 [ PATCH // SECURITY ]
- **[ USER_DEFAULT ]**: Web Terminal now auto-logs in as `lemue` (instead of root). Root access via `sudo`.
- **[ CREDENTIALS ]**: Set default ssh password for `lemue` to `lemue` (Change immediately).

## [2.0.13] - 2026-01-13
### 🧹 [ CHORE // CLEANUP ]
- **[ ASSET_PURGE ]**: Removed redundant `report-2.html` and obsolete `player.html` (Audio).

## [2.0.12] - 2026-01-13
### 🐛 [ PATCH // STABILITY ]
- **[ BOOT_LOOP_FIX ]**: Forced blind `luksClose` in `entrypoint.sh` to handle stale kernel mappings correctly when `/dev/mapper` is desynchronized.

## [2.0.11] - 2026-01-13
### 🚀 [ FEATURE // INTELLIGENCE ]
- **[ INTERACTIVE_REPORTS ]**: Deployed new Interactive HTML Reports (Dashboard Style) for both German (`report.html`) and English (`report-EN.html`).

## [2.0.10] - 2026-01-13
### 📝 [ PATCH // DOCUMENTATION ]
- **[ FULL_DISCLOSURE ]**: Linked all available report formats (PDF/MD for both DE/EN) in the Intelligence section.

## [2.0.9] - 2026-01-13
### 📦 [ ASSETS // INTELLIGENCE ]
- **[ REPORT_DATA ]**: Added and linked `report-EN.pdf` and `report-EN.md` to documentation.

## [2.0.8] - 2026-01-13
### 🐛 [ PATCH // CRITICAL_FIX ]
- **[ MISSING_BINARY ]**: Added `e2fsprogs` to provide `mkfs.ext4` for volume formatting.
- **[ RECOVERY_LOGIC ]**: Added auto-cleanup for stuck LUKS mappings in `entrypoint.sh` to prevent boot loops.

## [2.0.7] - 2026-01-13
### 🐛 [ PATCH // STABILITY ]
- **[ BUILD_FIX ]**: Fixed `mkdir` error in Dockerfile during SSH setup (`mkdir -p`).
- **[ DOCS_STANDARDIZATION ]**: Renamed `Info.html` to `info.html` for consistent GitHub Pages routing.

## [2.0.6] - 2026-01-13
### 📦 [ ASSETS // MEDIA ]
- **[ VIDEO_FILE ]**: Committed `terminal.mp4` asset to `docs/` for the Video Log player.

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
