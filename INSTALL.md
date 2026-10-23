# GhostSpectrum Installation Guide

This guide covers the standard setup flow for GhostSpectrum, the portable PowerShell-based workflow used in locked-down or public-library terminals, and the execution policy considerations for Windows systems.

## 1. Prerequisites

GhostSpectrum is a local-first Electron desktop dashboard. To run it successfully you need:

- Git
- A portable or system-wide Node.js runtime (Node.js 18+ recommended)
- npm (bundled with Node.js)
- Access to the project folder on disk
- Optional: Windows PowerShell 5.1+ or PowerShell 7+

### Required tools

- Git: used to clone the repository and manage source updates.
- Node.js: required to install dependencies and run the Electron app.
- npm: installs project dependencies such as `node-pty`, `xterm`, and `systeminformation`.

### Recommended runtime

Use a locally portable Node installation when you are on a shared, public, or restricted machine. This prevents the need to install global system packages or modify system-level registry settings.

## 2. Standard User Installation

### Clone the repository

```bash
git clone https://github.com/io808mafialivenow/GhostSpectrum.git
cd GhostSpectrum
```

### Install dependencies

```bash
npm install
npm run rebuild
```

### Launch GhostSpectrum

```bash
npm start
```

If you want to skip the intro splash or any extra startup loader behavior, use:

```bash
npm start -- --nointro
```

### Build the app for release packaging

```bash
npm run build
```

This creates the Electron release output in the project `dist` folder.

## 3. Portable / Restricted Environment Installation

If you are using a library terminal, lab workstation, public kiosk, or a machine with limited admin access, install as self-contained as possible inside the project directory.

### Use the portable PowerShell IDE workflow

From PowerShell:

```powershell
cd GhostSpectrum
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

The script is designed to:

- set up or reuse a portable Node runtime in a local project folder
- install dependencies without global system changes
- rebuild native modules like `node-pty`
- launch the app in a self-contained environment
- support quick release packaging without requiring permanent system installation

### Typical restricted-environment flow

1. Open PowerShell from the project folder.
2. Run: `powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1`
3. Choose the option to install or repair the portable Node runtime.
4. Choose the dependency install and rebuild option.
5. Launch GhostSpectrum using the menu or run `npm start` afterward.

## 4. Windows PowerShell Execution Policy Bypass

Restricted systems often block local script execution with an execution policy such as `Restricted` or `AllSigned`.

Bypass safely for the current session:

```powershell
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

Or from a PowerShell session already opened:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\ghost_ide.ps1
```

This only changes the policy for the active process and does not permanently alter system-wide trust settings.

### Why this matters

GhostSpectrum includes a Windows bootstrap and portable IDE workflow for users who cannot install software globally. PowerShell restrictions are a common barrier in public institutions, labs, and shared terminals. The bypass command allows a local script to run without requiring administrator rights.

## 5. Common Setup Notes

### If `npm` is missing

Make sure Node.js is installed and available on PATH.

```powershell
node -v
npm -v
```

If Node is not detected, install a portable Node runtime or use the provided PowerShell bootstrap workflow.

### If native modules fail

```bash
npm install
npm run rebuild
```

The rebuild step is important because GhostSpectrum depends on `node-pty`, which compiles native bindings.

### If the app still fails to launch

- confirm Node is in PATH
- confirm you are in the project root
- retry `npm install` and `npm run rebuild`
- if executing a local script, use PowerShell execution policy bypass

## 6. Release Packaging

For a production-ready zip or packaged artifact, use the PowerShell packaging flow:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_release.ps1
```

This script is designed to validate the local runtime, rebuild dependencies, run the Electron build, and package the output into a clean release archive.

## 7. Summary

GhostSpectrum is designed to be resilient in both standard developer setups and restricted public environments. The recommended path is:

- use Node.js locally or in a portable project folder
- install dependencies with `npm install`
- rebuild native modules with `npm run rebuild`
- if PowerShell blocks script execution, use `-ExecutionPolicy Bypass`
- use `ghost_ide.ps1` for self-contained, locked-down workflows

For more details, see `HELP.md` and `FAQ.md`.
