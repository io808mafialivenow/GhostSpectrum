Write-Host "=== Installing GhostSpectrum for Windows ===" -ForegroundColor Cyan
Write-Host "Run this script with: powershell -ExecutionPolicy Bypass -File .\install_ghostspectrum.ps1" -ForegroundColor DarkGray
Write-Host "" 

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

$nodePresent = $null -ne (Get-Command node -ErrorAction SilentlyContinue)
if (-not $nodePresent) {
    Write-Host "Node.js was not found on PATH. The project requires a local or portable Node runtime." -ForegroundColor Yellow
    Write-Host "Use the portable IDE workflow or install Node.js 18+ before continuing." -ForegroundColor Yellow
    Write-Host "Example: powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1" -ForegroundColor Cyan
    exit 1
}

Write-Host "Installing dependencies..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Rebuilding native dependencies..." -ForegroundColor Yellow
npm run rebuild
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "GhostSpectrum successfully bootstrapped. Run 'npm start' to launch." -ForegroundColor Green
Write-Host "Alternative: powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1" -ForegroundColor Cyan
