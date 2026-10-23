$ErrorActionPreference = 'Stop'

$appName = 'ghost'
$installRoot = Join-Path $HOME '.ghostspectrum'
$configDir = Join-Path $installRoot 'config'
$themeDir = Join-Path $installRoot 'themes'
$logDir = Join-Path $installRoot 'logs'

New-Item -ItemType Directory -Force -Path $configDir, $themeDir, $logDir | Out-Null

@{
  appName = 'GhostSpectrum'
  theme = 'default'
  terminalPath = '~/'
  modules = @('usb-hid', 'android-tools', 'heimdall', 'adb-fastboot')
} | ConvertTo-Json | Set-Content -Path (Join-Path $configDir 'ghostspectrum.json')

if (-not (Get-Command $appName -ErrorAction SilentlyContinue)) {
  "$appName` alias not configured automatically in PowerShell profile. Add: Set-Alias $appName 'npm start -- --nointro'" | Out-File -Append -Encoding utf8 (Join-Path $HOME 'Documents\PowerShell\profile.ps1')
  Write-Host 'GhostSpectrum alias setup instruction added to PowerShell profile.'
}

Write-Host "GhostSpectrum bootstrap complete. Files created under $installRoot"
