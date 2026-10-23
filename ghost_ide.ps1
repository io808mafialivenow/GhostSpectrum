# GhostSpectrum Portable IDE

This script is intended to support portable or restricted-environment setup for GhostSpectrum.
It allows users to run the project without system-wide install steps and can help in locked-down public terminals.

param()

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

function Show-Header {
    Write-Host "" 
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " GhostSpectrum Portable IDE" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "" 
}

function Test-Command {
    param([string]$Name)
    $cmd = Get-Command $Name -ErrorAction SilentlyContinue
    return $null -ne $cmd
}

function Ensure-PortableNode {
    $portableRoot = Join-Path $repoRoot '.portable'
    $nodeDir = Join-Path $portableRoot 'node'
    $nodeExe = Join-Path $nodeDir 'node.exe'

    if (Test-Path $nodeExe) {
        Write-Host "Portable Node runtime already available at $nodeDir" -ForegroundColor Green
        return $nodeExe
    }

    Write-Host "Portable Node runtime not found. Downloading a local copy..." -ForegroundColor Yellow
    $downloadUrl = 'https://nodejs.org/dist/latest-v20.x/node-v20.18.0-win-x64.zip'
    $archivePath = Join-Path $portableRoot 'node-v20.18.0-win-x64.zip'

    New-Item -ItemType Directory -Force -Path $portableRoot | Out-Null

    try {
        Invoke-WebRequest -Uri $downloadUrl -OutFile $archivePath
        Expand-Archive -Path $archivePath -DestinationPath $portableRoot -Force
        $expandedDir = Join-Path $portableRoot 'node-v20.18.0-win-x64'
        if (Test-Path $expandedDir) {
            Rename-Item -Path $expandedDir -NewName 'node' -Force
        }
        if (Test-Path $nodeExe) {
            Write-Host "Portable Node runtime installed successfully." -ForegroundColor Green
            return $nodeExe
        }
    }
    catch {
        Write-Host "Portable download failed: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Try installing Node.js locally or run this script on a machine with internet access." -ForegroundColor Yellow
    }

    return $null
}

function Initialize-ProjectEnv {
    $nodeExe = Ensure-PortableNode
    if ($nodeExe) {
        $nodeBin = Split-Path -Parent $nodeExe
        $env:PATH = "$nodeBin;$env:PATH"
        $env:DEBUG = 'ghostspectrum'
        Write-Host "Node environment updated for current PowerShell session." -ForegroundColor Green
    }
}

function Invoke-InstallSteps {
    Write-Host "Running npm install..." -ForegroundColor Yellow
    & npm install
    if ($LASTEXITCODE -ne 0) { throw "npm install failed." }

    Write-Host "Running native rebuild..." -ForegroundColor Yellow
    & npm run rebuild
    if ($LASTEXITCODE -ne 0) { throw "npm rebuild failed." }
    Write-Host "Dependency installation and rebuild completed." -ForegroundColor Green
}

function Launch-GhostSpectrum {
    if (-not (Test-Command 'npm')) {
        Write-Host "npm is not available in PATH. Use option 2 first to install Portable Node." -ForegroundColor Red
        return
    }

    Write-Host "Launching GhostSpectrum..." -ForegroundColor Cyan
    & npm start
}

function Build-ReleaseArchive {
    Write-Host "Preparing release build archive..." -ForegroundColor Yellow
    try {
        & npm run build
        if ($LASTEXITCODE -ne 0) { throw "Electron build failed." }

        $distDir = Join-Path $repoRoot 'dist'
        if (-not (Test-Path $distDir)) {
            Write-Host "No dist directory was produced. Build did not complete as expected." -ForegroundColor Red
            return
        }

        $archivePath = Join-Path $repoRoot 'GhostSpectrum-Release.zip'
        if (Test-Path $archivePath) { Remove-Item $archivePath -Force }
        Compress-Archive -Path (Join-Path $distDir '*') -DestinationPath $archivePath -Force
        Write-Host "Release archive created: $archivePath" -ForegroundColor Green
    }
    catch {
        Write-Host "The release package step failed: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function Show-Diagnostics {
    Write-Host "Runtime diagnostics:" -ForegroundColor Cyan
    $nodePresent = Test-Command 'node'
    $npmPresent = Test-Command 'npm'

    if ($nodePresent) {
        & node -v
    } else {
        Write-Host "Node.js is not available on PATH." -ForegroundColor Yellow
    }

    if ($npmPresent) {
        & npm -v
    } else {
        Write-Host "npm is not available on PATH." -ForegroundColor Yellow
    }

    if (Test-Path (Join-Path $repoRoot 'node_modules')) {
        Write-Host "Project dependencies appear to be installed." -ForegroundColor Green
    } else {
        Write-Host "node_modules folder is missing; dependency installation is required." -ForegroundColor Yellow
    }
}

function Show-Menu {
    Show-Header
    Write-Host "1. Download / repair portable Node runtime"
    Write-Host "2. Install dependencies and rebuild native modules"
    Write-Host "3. Launch GhostSpectrum"
    Write-Host "4. Build release archive"
    Write-Host "5. Diagnostics"
    Write-Host "6. Exit"
    Write-Host ""
    $choice = Read-Host "Select an option"

    switch ($choice) {
        '1' {
            Initialize-ProjectEnv
        }
        '2' {
            Initialize-ProjectEnv
            Invoke-InstallSteps
        }
        '3' {
            Initialize-ProjectEnv
            Launch-GhostSpectrum
        }
        '4' {
            Initialize-ProjectEnv
            Build-ReleaseArchive
        }
        '5' {
            Show-Diagnostics
        }
        '6' {
            Write-Host "Exiting GhostSpectrum Portable IDE." -ForegroundColor Green
            return
        }
        default {
            Write-Host "Invalid selection." -ForegroundColor Red
        }
    }

    Write-Host "" 
    Write-Host "Press Enter to return to the menu..."
    Read-Host | Out-Null
    Show-Menu
}

Write-Host "Tip: If PowerShell blocks script execution, run: powershell -ExecutionPolicy Bypass -File .\ghost_ide.ps1" -ForegroundColor DarkGray
Show-Menu

