# GhostSpectrum ⚡

GhostSpectrum is a cutting-edge, sci-fi Electron-based terminal dashboard and system HUD, inspired by the upstream eDEX-UI project. Built with full GPL-3.0-or-later compliance, it transforms your standard system shell into an immersive tactical cyber-deck interface.

---

## 🚀 Key Features

* **Sci-Fi Terminal HUD Core:** Frameless, transparent Tron-inspired interface with real-time system telemetry (CPU, memory, network stats).
* **Embedded PTY Engine:** High-performance shell interaction powered by `node-pty` and `xterm.js`.
* **Aether-Net Stream Ripper:** Scrapes and extracts raw media streams, audio tracks, and manifests directly from site code.
* **Android 16+ & Repair Toolkits:** Integrated scaffolding for ADB device scanning, Fastboot flashing, and Samsung Heimdall firmware routines.
* **USB-HID / Rubber Ducky Simulator:** Interactive macro injector for payload testing.
* **Stealth Cloak Panic Button (`F12`):** Instantly hides or unhides the entire application window in milliseconds.
* **Fullscreen Toggle (`F11`):** Seamless hotkey toggling between windowed and immersive fullscreen HUD states.
* **Draggable Window Header:** Invisible top-edge drag region enabling free positioning of the frameless window.
* **Portable Library IDE (`ghost_ide.ps1`):** A custom PowerShell development wrapper designed to bypass restricted user policies on public or shared terminals.

---

## 📂 Project Structure

```text
GhostSpectrum/
├── src/
│   ├── _boot.js                  # Electron main process & IPC handlers (Stealth/PTY)
│   ├── preload.js               # Context bridge for secure renderer communication
│   └── index.html               # Futuristic HUD dashboard, XTerm, and stealth controls
├── ghost_ide.ps1               # Standalone Portable PowerShell IDE & Demoscene Launcher
├── install_ghostspectrum.sh     # Linux bootstrap installer script
├── install_ghostspectrum.ps1    # Windows bootstrap installer script
├── LICENSE                     # GPL license
├── README.md                  # Project overview & usage
└── package.json               # Node.js configuration & build targets
