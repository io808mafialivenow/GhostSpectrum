# GhostSpectrum

GhostSpectrum is a modernized, feature-extended fork and revival of eDEX-UI for sci-fi terminal dashboard workflows. It preserves the elegant terminal-first HUD model of eDEX-UI while adding a modular, offline-first expansion layer for developer tooling, local AI assistance, Android repair utilities, and alpha-stage testing workflows.

This project is designed to be:
- cross-platform
- offline-first
- developer-friendly
- easy to extend with modular subsystems
- resilient without cloud dependencies or hosted AI APIs

Important attribution and licensing:
- Upstream project: GitSquared/eDEX-UI
- Upstream license: GPL-3.0-or-later
- This fork remains under GPL-3.0-or-later and retains upstream copyright notices and repository license terms.

## Architecture overview

GhostSpectrum is structured around a lightweight Electron shell that launches a system HUD and terminal session, while a modular expansion framework adds subsystem capability without hard-coding all features into the bootstrap file.

Core structure:
- src/_boot.js — Electron app bootstrap, PTY terminal, IPC handlers, startup registry
- src/index.html — HUD layout and UI shell
- src/preload.js — secure bridge between renderer and Electron main process
- src/renderer.js — frontend HUD updates
- src/modules/ — modular runtime extensions for app orchestration and AI
- src/userData/ — local user state and runtime metadata
- alpha_test.ps1 / alpha_test.sh — alpha test runners for Windows and Unix-like systems

## Current feature areas

GhostSpectrum includes:
- sci-fi HUD / telemetry dashboard
- PTY-backed terminal session
- local system telemetry polling
- Android toolchain actions
- Fastboot / ADB / Heimdall workflow hooks
- modular AI assistant framework
- offline-first local Ollama support
- fallback behavior for systems without external AI services
- packaging and alpha validation scripts for each platform

## Offline-first AI design

GhostSpectrum is designed to work without requiring a cloud service or external AI backend.

The AI layer:
- attempts to use local Ollama if it is installed and reachable
- falls back to a local deterministic assistant mode when Ollama is unavailable
- does not require network access for core app operation
- keeps prompts and tools modular so new agents or workflows can be added without breaking the app shell

This is intentionally developer-friendly and easy to extend.

## Requirements

For the base app:
- Node.js 18+
- npm
- Electron runtime
- platform-native shell support

For local AI:
- Ollama (optional)
- local model downloaded and running locally, such as llama3.1 or similar

For Android tooling:
- ADB, Fastboot, or Heimdall when present on the host machine

## Install

Clone:
```bash
git clone https://github.com/io808mafialivenow/GhostSpectrum.git
cd GhostSpectrum
