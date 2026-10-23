# GhostSpectrum ⚡

GhostSpectrum is a dark, local-first cyberdeck built as a modernized revival of eDEX-UI. It keeps the old terminal-HUD magic, but sharpens it into a more modular, resilient, and practical desktop environment for developers, operators, and power users.

This project is designed to be:
- cross-platform
- offline-first
- developer-friendly
- easy to extend
- free from cloud dependency

GhostSpectrum combines a futuristic HUD interface with PTY-backed terminal sessions, local telemetry, Android tooling, optional local AI, and modular subsystem expansion.

---

## Why GhostSpectrum?

GhostSpectrum gives you a terminal-centric cyberdeck for local development and operator-style workflows:

- terminal sessions and command execution in a sci-fi control room
- system telemetry and live resource monitoring
- Android repair and debugging workflows
- portable, local-first development support for restricted environments
- optional AI and streaming utility modules
- lightweight local control without relying on a remote service

---

## Features

- Sci-fi terminal HUD core
- PTY-backed terminal sessions
- local system telemetry and status overlays
- Android tooling support for ADB, Fastboot, and Heimdall
- optional local AI support through Ollama
- stream ripping and media extraction support
- USB HID / Rubber Ducky simulation tooling
- stealth cloak panic mode (`F12`)
- fullscreen toggle (`F11`)
- draggable frameless window edge
- portable library IDE workflow via `ghost_ide.ps1`

---

## Project Structure

```text
GhostSpectrum/
├── src/
│   ├── _boot.js                    # Electron bootstrap & PTY startup
│   ├── preload.js                 # Secure bridge between main and renderer
│   ├── renderer.js                # HUD refresh logic and live UI updates
│   ├── index.html                 # HUD layout and terminal shell
│   ├── styles.css                 # Cyberdeck styling and visual system
│   └── userData/                  # Local runtime metadata and state
├── file-icons/                    # UI icons used by the app
├── media/                         # bundled media assets
├── ghost_ide.ps1                  # portable PowerShell IDE wrapper
├── install_ghostspectrum.sh       # Linux bootstrap installer
├── install_ghostspectrum.ps1      # Windows bootstrap installer
├── LICENSE                        # GPL-3.0-or-later license
├── README.md                      # usage and onboarding instructions
├── package.json                   # Electron app metadata and scripts
└── .gitignore                     # repo local ignores
```

---

## Requirements

### Base app
- Node.js 18+
- npm
- Electron runtime

### Optional local AI
- Ollama

### Optional Android tooling
- ADB
- Fastboot
- Heimdall

If these optional tools are missing, GhostSpectrum can still run in base mode, but some AI and Android features may be limited.

---

## Quick Start

Clone the project:

```bash
git clone https://github.com/io808mafialivenow/GhostSpectrum.git
cd GhostSpectrum
```

Install dependencies:

```bash
npm install
npm run rebuild
```

Start the app:

```bash
npm start
```

If you want the version without the intro splash or extra startup window, use:

```bash
npm start -- --nointro
```

---

## Optional Bootstrap Helpers

On Linux:

```bash
./install_ghostspectrum.sh
```

On PowerShell / Windows:

```powershell
./install_ghostspectrum.ps1
```

These scripts are meant to help bootstrap the local environment and package dependencies more easily on supported systems.

---

## Portable Library / Restricted Environment Setup

If you are using a public, locked-down, or restricted environment such as a public library terminal, you may not have permission to install Node.js or modify system-level configuration. GhostSpectrum includes a portable workflow to help in that case.

### Use the portable IDE

From PowerShell:

```powershell
cd GhostSpectrum
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

Inside the menu:
- Press `2` to download and set up a portable Node.js runtime in the project folder
- Press `3` to install dependencies and rebuild native modules
- Press `7` to inject or verify stealth and HUD integration hooks
- Press `4` to launch GhostSpectrum

This is intended to help bypass local restrictions and keep development self-contained.

---

## Build Instructions

Build the app and generate distributables:

```bash
npm run build
npm run build:linux
npm run build:win
npm run build:mac
```

This project supports standard Electron packaging targets for Linux, Windows, and macOS.

---

## Tactical Controls and Hotkeys

- Window movement: click and drag along the top edge of the HUD window
- Fullscreen toggle: press `F11`
- Stealth cloak / hide app: press `F12`
- Panic button: click the red `[CLOAK]` button in the UI

These controls are intended for quick concealment or quick access during focused work.

---

## Recommended Developer Setup

For best working results on a normal machine:

```bash
# Node 18+
node -v
npm -v

# Optional local AI
command -v ollama || echo "Install Ollama: https://ollama.com/download"

# Optional Android tools
command -v adb || echo "ADB not installed"
command -v fastboot || echo "Fastboot not installed"
command -v heimdall || echo "Heimdall not installed"
```

---

## Troubleshooting

### App does not start
- verify Node.js is installed and on the PATH
- run `npm install`
- if native modules fail, run `npm run rebuild`

### Missing terminal / PTY features
- reinstall dependencies
- ensure Electron is installed locally via the project package

### UI or window behavior feels wrong
- check that the app is not in stealth mode (`F12`)
- verify the frameless drag region is working normally

### Restricted environment issues
- use the portable workflow documented in `ghost_ide.ps1`
- run PowerShell with `-ExecutionPolicy Bypass`

---

## License and Attribution

Upstream project: eDEX-UI / GitSquared

This project remains under the GPL-3.0-or-later license and retains upstream copyright notices and repository license terms.

---

## Final Note

GhostSpectrum is best understood as a local-first, developer-centric cyberdeck: a terminal dashboard with optional AI, Android tools, and a modular architecture built for operators who prefer control, speed, and privacy over cloud dependence.
