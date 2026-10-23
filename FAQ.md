# GhostSpectrum FAQ

## What is the F12 Panic Cloak?

The F12 Panic Cloak is a quick concealment mode intended to hide the GhostSpectrum HUD instantly when you need to duck out of a visible workstation or switch context rapidly. It behaves as a stealth toggle and is tied to the HUD's emergency concealment flow.

### How it works

- Press `F12` to trigger the panic cloak state.
- The app hides or reduces its visible footprint so it is less obvious to casual observers.
- This is a user-focused accessibility and concealment shortcut rather than a destructive action.

### How to use it safely

- Use F12 only when you intentionally need to hide the desktop session.
- If you are working in a shared environment, confirm the app is not in a mode where you accidentally lose track of the interface.
- Make sure the workspace is saved or the command terminal session is understood before toggling a stealth state in a public or shared machine.
- Use the app's HUD controls or visible UI toggles to re-activate the interface if needed.

### Best practice

Treat F12 as a tactical concealment/control key, not as a risk to your data or environment. It is designed for fast hidden access and quick switching, not as a destructive shutdown or data wipe.

## How do I toggle fullscreen mode?

GhostSpectrum supports fullscreen by pressing `F11`.

### Standard flow

- Press `F11` to toggle fullscreen on or off.
- If the window is in frameless mode, click and drag along the top edge to reposition it.

### Using the window drag bar

The app uses a frameless, HUD-style interface. You can move the desktop window by clicking and dragging the top edge or drag region of the window. This allows for quick repositioning without needing to rely on Windows title bars or native controls.

## Can I use GhostSpectrum on restricted public library terminals without admin rights?

Yes. GhostSpectrum is designed with a portable workflow to allow use in public library terminals and similar restricted systems.

### Recommended method

```powershell
cd GhostSpectrum
powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1
```

This approach avoids a system-wide install and keeps the runtime local to the project directory.

### Why it works

- no admin rights are required
- no permanent system installation is required
- runtime can live inside the repository folder
- PowerShell policy can be bypassed only for the active process

## What if `npm` is missing?

Use the portable PowerShell IDE or install a local Node.js runtime in the project folder. After the runtime is available, run:

```bash
npm install
npm run rebuild
```

## What if PowerShell blocks script execution?

Use a process-scoped bypass:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\ghost_ide.ps1
```

This does not change the system-wide configuration and is the safest choice on locked-down machines.

## Does GhostSpectrum work offline?

Yes. GhostSpectrum is designed to be local-first and offline-friendly. The app does not require cloud-based services to run in its core HUD and terminal functionality.

## Is GhostSpectrum safe for development and testing?

GhostSpectrum is intended for local development and operator-style workflows. Most of its features are local simulations or self-contained tooling. Use caution when working with any payload injection or USB HID simulation features, and only use them in controlled, authorized environments.

## Where do I find the portable workflow documentation?

See:

- `INSTALL.md`
- `HELP.md`
- `ghost_ide.ps1`
- `build_release.ps1`
