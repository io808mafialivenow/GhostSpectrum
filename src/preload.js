const { contextBridge } = require('electron');

contextBridge.exposeInMainWorld('ghost', {
  appName: 'GhostSpectrum',
  version: '0.1.0',
  platform: process.platform,
  arch: process.arch
});
