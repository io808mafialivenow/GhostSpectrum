# GhostSpectrum // Null Signal

GhostSpectrum is a modernized, feature-extended revival of eDEX-UI built for sci-fi terminal dashboard workflows.

It keeps the old terminal-first HUD feel of eDEX-UI, but pushes it further with modular systems, local-first tooling, and a dev workflow that doesn’t depend on cloud garbage. Think dark cyberdeck UI, PTY terminal, telemetry feed, Android toolchain support, and optional local AI all running inside a dead-silent command console.

This project is designed to be:
- cross-platform
- offline-first
- developer-friendly
- easy to extend with modular subsystems
- resilient without cloud dependencies or hosted AI APIs

## Attribution / legal

Important attribution and licensing:
- Upstream project: GitSquared/eDEX-UI
- Upstream license: GPL-3.0-or-later
- This fork remains under GPL-3.0-or-later and retains upstream copyright notices and repository license terms.

---

## Overview

GhostSpectrum is an Electron-based desktop application that blends a sci-fi dashboard UI with a PTY-backed terminal session, system telemetry, and modular workflows for local developer tasks.

At a high level, it is a terminal-centric cyberdeck / HUD app for:
- running shell sessions in a polished interface
- monitoring local system information
- supporting Android toolchains and flashing workflows
- integrating optional local AI with Ollama
- extending functionality through modular subsystems instead of hard-coded logic

---

## High-level architecture

GhostSpectrum is built around a lightweight Electron shell that launches a system HUD and terminal session, while a modular expansion framework adds subsystem capability without hard-coding everything into one giant mess.

Core structure:
- `src/_boot.js` — Electron app bootstrap, PTY terminal, IPC handlers, startup registry
- `src/index.html` — HUD layout and UI shell
- `src/preload.js` — secure bridge between main and renderer
- `src/renderer.js` — frontend HUD updates
- `src/styles.css` — visual styling and sci-fi theme
- `src/userData/` — local user state and runtime metadata
- `file-icons/` — UI icons used by the app shell
- `media/` — bundled media assets
- `install_ghostspectrum.sh` / `install_ghostspectrum.ps1` — bootstrap helpers for Linux/macOS and Windows

---

## Current feature areas

GhostSpectrum includes:
- sci-fi HUD / telemetry dashboard
- PTY-backed terminal session
- local system telemetry polling
- Android toolchain actions
- Fastboot / ADB / Heimdall workflow hooks
- modular AI assistant framework
- offline-first local Ollama support
- fallback behavior when external AI services are unavailable
- packaging and alpha validation scripts for each platform

---

## Local AI, no cloud required

GhostSpectrum is designed to work without requiring a cloud service or external AI backend.

The AI layer:
- tries local Ollama first if it is installed and reachable
- falls back to a local deterministic assistant mode when Ollama is unavailable
- does not require internet access for core app operation
- keeps prompts and tools modular so new agents or workflows can be added without breaking the app shell

This is intentionally local, flexible, and easy to extend.

---

## Requirements

For the base app:
- Node.js 18+
- npm
- Electron runtime
- platform-native shell support

For local AI:
- Ollama (optional)
- a local model downloaded and running locally, such as `llama3.1` or similar

For Android tooling:
- ADB, Fastboot, or Heimdall when present on the host machine

---

## Quick start / install

Clone the repo:

```bash
git clone https://github.com/io808mafialivenow/GhostSpectrum.git
cd GhostSpectrum
```

Install dependencies:

```bash
npm install
npm run rebuild
```

You can also use the repo-provided bootstrap helpers:

Linux/macOS:
```bash
./install_ghostspectrum.sh
```

Windows (PowerShell):
```powershell
./install_ghostspectrum.ps1
```

Run the app:

```bash
npm start
```

The package uses the default app startup entry point in `src/_boot.js`.

---

## Build and package

The project includes Electron build scripts in `package.json`:

```bash
npm run build
npm run build:linux
npm run build:win
npm run build:mac
```

These build distributables into the `dist/` folder using `electron-builder`.

---

## Project type

This repo is a desktop application project, not a traditional web app. It is built around:
- Electron
- HTML/CSS/JS front-end shell
- `node-pty` for terminal integration
- `xterm` for terminal rendering
- system information polling for local telemetry
- modular extension points for future workflow tools and AI agents

---

## License

This project is licensed under the GNU General Public License v3.0 or later (GPL-3.0-or-later).

---

## Final transmission

GhostSpectrum is best understood as a local-first, developer-centric cyberdeck: a sci-fi terminal dashboard with optional AI support, Android workflow hooks, and a modular architecture built for real-world experimentation.

It keeps the classic eDEX-UI vibe, but makes the whole system more adaptable, more resilient, and much more useful as a local developer tool.

This is the kind of interface you boot when you want the terminal to feel like a weapon and the monitor to feel like a command center.
