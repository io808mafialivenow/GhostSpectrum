const path = require('path');

const app = {
  name: 'GhostSpectrum',
  title: 'GhostSpectrum HUD',
  version: '0.1.0',
  platform: process.platform
};

const metrics = {
  cpu: '68.4%',
  ram: '74.1%',
  network: '4.8 Gbps',
  uptime: '04h 21m 18s',
  temp: '62°C'
};

const root = document.getElementById('app');
const title = document.getElementById('title');
const clock = document.getElementById('clock');
const metricEls = {
  cpu: document.getElementById('metric-cpu'),
  ram: document.getElementById('metric-ram'),
  network: document.getElementById('metric-network'),
  uptime: document.getElementById('metric-uptime'),
  temp: document.getElementById('metric-temp')
};

if (title) {
  title.textContent = `${app.name} // ${app.platform.toUpperCase()} // ${app.version}`;
}

if (clock) {
  const updateClock = () => {
    const now = new Date();
    clock.textContent = `${now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' })} // ${now.toLocaleDateString([], { weekday: 'short', month: 'short', day: 'numeric', year: 'numeric' })}`;
  };

  updateClock();
  setInterval(updateClock, 1000);
}

Object.entries(metricEls).forEach(([key, element]) => {
  if (element) {
    element.textContent = `${metrics[key]}`;
  }
});

if (root) {
  root.dataset.platform = app.platform;
}
