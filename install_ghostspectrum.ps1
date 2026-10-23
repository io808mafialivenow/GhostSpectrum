Write-Host "=== Installing GhostSpectrum for Windows ===" -ForegroundColor Cyan
npm install
npm run rebuild
Write-Host "GhostSpectrum successfully bootstrapped. Run 'npm start' to launch." -ForegroundColor Green
