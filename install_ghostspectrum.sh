#!/usr/bin/env bash
set -e
echo "=== Installing GhostSpectrum for Linux ==="
npm install
npm run rebuild
echo "GhostSpectrum successfully bootstrapped. Run 'npm start' to launch."
