# GhostSpectrum // Null Signal

GhostSpectrum is a dark, local-first cyberdeck built as a modernized revival of eDEX-UI.

It keeps the old terminal-HUD magic, but sharpens it into something more modular, more resilient, and more useful for real developer workflows. A terminal shell. A telemetry feed. Android tools. Local AI. A quiet interface that feels like it belongs in a sealed server room at 3AM.

This project is designed to be:
- cross-platform
- offline-first
- developer-friendly
- easy to extend
- free from cloud dependency

## Attribution & License

- Upstream project: GitSquared/eDEX-UI
- Upstream license: GPL-3.0-or-later
- This fork remains under GPL-3.0-or-later and retains upstream copyright notices and repository license terms.

---

## What it does

GhostSpectrum is an Electron-based desktop app that combines:
- a sci-fi HUD interface
- PTY-backed terminal sessions
- local system telemetry
- Android tooling workflows
- optional local AI with Ollama
- modular subsystem expansion

At a glance, it is a terminal-centric cyberdeck for local development and operator-style workflows.

---

## Architecture

GhostSpectrum is built around a lightweight Electron shell that boots the HUD and terminal, then allows modular subsystems to expand the experience without turning the app into a tangled mess.

Core structure:
- `src/_boot.js` — app bootstrap and PTY system
- `src/index.html` — HUD layout
- `src/preload.js` — bridge between main and renderer
- `src/renderer.js` — live HUD updates
- `src/styles.css` — cyberpunk visual styling
- `src/userData/` — local state and runtime metadata
- `file-icons/` — UI icons
- `media/` — bundled media assets
- `install_ghostspectrum.sh` / `install_ghostspectrum.ps1` — bootstrap helpers

---

## Prerequisites

Quick setup for a fresh machine:

```bash
# Node.js 18+ and npm
node -v
npm -v

# Electron runtime
npm install --save-dev electron

# Optional: local AI
command -v ollama || echo "Install Ollama: https://ollama.com/download"

# Optional: Android tools
command -v adb || echo "ADB not installed"
command -v fastboot || echo "Fastboot not installed"
command -v heimdall || echo "Heimdall not installed"
```

If any of the optional tools are missing, GhostSpectrum will still run in base mode, but local AI and Android workflow features may be limited.

---

## Requirements

Base app:
- Node.js 18+
- npm
- Electron runtime

Local AI:
- Ollama (optional)

Android tooling:
- ADB / Fastboot / Heimdall (optional)

---

## Install

```bash
git clone https://github.com/io808mafialivenow/GhostSpectrum.git
cd GhostSpectrum
npm install
npm run rebuild
npm start
```

Optional bootstrap scripts:
```bash
./install_ghostspectrum.sh
```

or

```powershell
./install_ghostspectrum.ps1
```

---

## Build

```bash
npm run build
npm run build:linux
npm run build:win
npm run build:mac
```

---

## License

This project is licensed under the GNU General Public License v3.0 or later (GPL-3.0-or-later).

---

## Final note

GhostSpectrum is best understood as a local-first, developer-centric cyberdeck: a terminal dashboard with optional AI, Android tools, and a modular architecture built for operators who prefer control over convenience.
