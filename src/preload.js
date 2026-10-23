const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('ghostAPI', {
  onTerminalOutput: (callback) => ipcRenderer.on('terminal-output', (e, data) => callback(data)),
  sendTerminalInput: (data) => ipcRenderer.send('terminal-input', data),
  resizeTerminal: (cols, rows) => ipcRenderer.send('terminal-resize', { cols, rows }),
  onTelemetry: (callback) => ipcRenderer.on('hud-telemetry', (e, data) => callback(data)),
  runToolkit: (action, payload) => ipcRenderer.invoke('run-toolkit-action', action, payload)
});
