const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const pty = require('node-pty');
const os = require('os');
const si = require('systeminformation');
const { exec } = require('child_process');

let mainWindow;
let ptyProcess = null;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1366,
    height: 768,
    frame: false,
    transparent: true,
    backgroundColor: '#00000000',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: false,
      contextIsolation: true
    }
  });

  mainWindow.loadFile(path.join(__dirname, 'index.html'));

  // Open DevTools in debug mode if requested
  if (process.argv.includes('--debug')) {
    mainWindow.webContents.openDevTools();
  }
}

app.whenReady().then(() => {
  createWindow();

  // Setup PTY Terminal Session
  const shell = process.env.SHELL || (os.platform() === 'win32' ? 'powershell.exe' : 'bash');
  
  try {
    ptyProcess = pty.spawn(shell, [], {
      name: 'xterm-256color',
      cols: 80,
      rows: 24,
      cwd: process.env.HOME || process.env.USERPROFILE,
      env: process.env
    });

    ptyProcess.onData((data) => {
      if (mainWindow && !mainWindow.isDestroyed()) {
        mainWindow.webContents.send('terminal-output', data);
      }
    });
  } catch (err) {
    console.error('Failed to spawn PTY process:', err);
  }

  ipcMain.on('terminal-input', (event, data) => {
    if (ptyProcess) {
      ptyProcess.write(data);
    }
  });

  ipcMain.on('terminal-resize', (event, { cols, rows }) => {
    if (ptyProcess) {
      try {
        ptyProcess.resize(cols, rows);
      } catch (e) {
        console.error('Resize error:', e);
      }
    }
  });

  // Telemetry poll loop
  setInterval(async () => {
    try {
      const cpu = await si.currentLoad();
      const mem = await si.mem();
      const net = await si.networkStats();
      if (mainWindow && !mainWindow.isDestroyed()) {
        mainWindow.webContents.send('hud-telemetry', {
          cpu: cpu.currentLoad.toFixed(1),
          memory: ((mem.used / mem.total) * 100).toFixed(1),
          network: net[0] ? { rx: net[0].rx_sec, tx: net[0].tx_sec } : { rx: 0, tx: 0 }
        });
      }
    } catch (e) {
      // Ignore poll dropouts
    }
  }, 1000);

  // USB-HID / Android / Heimdall Toolkit Handlers
  ipcMain.handle('run-toolkit-action', async (event, actionType, payload) => {
    return new Promise((resolve) => {
      let cmd = '';
      if (actionType === 'adb-devices') cmd = 'adb devices -l';
      else if (actionType === 'fastboot-devices') cmd = 'fastboot devices';
      else if (actionType === 'heimdall-detect') cmd = 'heimdall detect';
      else if (actionType === 'ducky-inject') {
        // Simulated injection sandbox test
        return resolve({ success: true, output: `[RUBBER-DUCKY] Payload simulated successfully (${payload.length} chars).` });
      } else {
        return resolve({ success: false, output: 'Unknown toolkit action requested.' });
      }

      exec(cmd, (error, stdout, stderr) => {
        if (error) {
          resolve({ success: false, output: stderr || error.message });
        } else {
          resolve({ success: true, output: stdout || 'Command executed successfully with no output.' });
        }
      });
    });
  });

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (ptyProcess) ptyProcess.kill();
  if (process.platform !== 'darwin') app.quit();
});
