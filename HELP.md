# GhostSpectrum Help

## Overview

GhostSpectrum is a dark, local-first cyberdeck and terminal dashboard modeled as a modernized, feature-extended revival of eDEX-UI. The project blends a sci-fi HUD interface, PTY-backed shell access, system telemetry, Android tooling hooks, and modular operator workflows into a cohesive desktop environment.

### Core modules

- Terminal core: PTY-backed shell sessions with xterm integration
- Telemetry matrix: CPU and memory monitoring
- Android toolchain: ADB, Fastboot, and Heimdall helpers
- Rubber Ducky payload simulation: for testing local simulated inject commands
- HUD status overlays: dynamic system telemetry and status panels
- Portability layer: self-contained local runtime for restricted workstations

## Using the Portable Library IDE

GhostSpectrum includes a PowerShell IDE wrapper intended for machines without admin rights or with script execution restrictions. This workflow lets you keep the project self-contained in the working folder and avoid system-level installs.

### Launching the IDE

```powershell
cd GhostSpectrum
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

### What the menu offers

The IDE menu provides a lightweight operator interface for common tasks:

- download or verify a portable Node.js runtime
- install project dependencies
- rebuild native addons
- launch the application
- run quick local release packaging or validation steps
- inspect project path / runtime health

### Typical portable workflow

1. Open PowerShell in the repo directory.
2. Run `ghost_ide.ps1` with execution policy bypass.
3. Choose the portable Node install option if Node is not available.
4. Rebuild native modules with the dependency option.
5. Launch GhostSpectrum from the menu.

This is especially useful on public library terminals, campus labs, shared machines, and similar locked-down environments.

## Micro-editor and Diagnostics

The portable IDE is not a full commercial IDE; it is a compact project launcher and diagnostics host.

### Features you can expect from the mini-workflow

- a quick local runtime check for Node and npm
- detection of missing project dependencies
- ability to run the rebuild step for `node-pty`
- launch command for the Electron app
- environment verification for a portable installation
- packaging prompts for archive generation and output checks

### Diagnostic checklist

When GhostSpectrum fails to start, check the following:

- `node -v` returns a valid version
- `npm -v` returns a valid version
- dependencies are present in `node_modules`
- `node-pty` has been rebuilt after install
- the project is launched from the repository root
- PowerShell execution policy has been bypassed for the session if necessary

## Troubleshooting

### 1. Path issues

If the project cannot be found or the script cannot run:

```powershell
Get-Location
Dir
```

Make sure you are inside the repository root before running:

```powershell
.\ghost_ide.ps1
```

If `node` or `npm` are not found, use the portable Node workflow or install a local runtime into the repository folder.

### 2. Execution policy errors

Common message:

- `running scripts is disabled on this system`

Fix:

```powershell
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

Or within an active PowerShell session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### 3. Missing npm or Node.js

If the terminal shows `npm: command not found` or `node: command not found`:

- install Node.js locally
- or use the portable runtime setup in `ghost_ide.ps1`
- then rerun `npm install`

### 4. `node-pty` rebuild errors

GhostSpectrum depends on `node-pty`, which often needs a native rebuild after installing dependencies.

```bash
npm install
npm run rebuild
```

If the rebuild fails:

- ensure a valid Node version is in use
- use the local or portable runtime rather than a broken global install
- delete the `node_modules` folder and reinstall if necessary

### 5. Restricted public library terminals

On public terminals, you often cannot:

- install apps at the system level
- grant admin rights
- set a persistent execution policy

The workaround is to keep the entire runtime in a portable folder, run PowerShell with a process-scoped bypass, and use the local project directory as your sandbox.

## Command Reference

### Standard launch

```bash
npm start
```

### Full launch with intro window

```bash
npm start -- --nointro
```

### Install dependencies

```bash
npm install
```

### Rebuild native modules

```bash
npm run rebuild
```

### Build release package

```bash
npm run build
```

## Summary

Use GhostSpectrum as a self-contained local cyberdeck. For standard local development, the normal `npm install` and `npm start` flow works well. For locked-down systems, the PowerShell portable workflow is the recommended method and should be run with execution policy bypass for the current process only.
