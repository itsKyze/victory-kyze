# Shader Pre-warming Script for Victory-Kyze (GTA VI on NVIDIA GTX 1650)
Set-Location -Path $PSScriptRoot

$env:VICTORY_HOST_WAVE = "32"
$gameDir = "D:\GTA6.Xbox.v1.0.2.1-CYBERLEEK"
$logFile = "last_run.log"

Write-Host "==========================================================" -ForegroundColor Green
Write-Host " Starting Victory-Kyze Shader Pre-warming & Compilation" -ForegroundColor Green
Write-Host " Wave Size: 32 (NVIDIA Turing NV167) | Worker Jobs: 10" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green

if (Test-Path $logFile) {
    Write-Host "`n>>> [Step 1/2] Pre-compiling shaders detected in last game session ($logFile)..." -ForegroundColor Cyan
    .\target\release\victory.exe translate --warm $logFile $gameDir --jobs 10
}

Write-Host "`n>>> [Step 2/2] Scanning and warming game shader archives in $gameDir..." -ForegroundColor Cyan
.\target\release\victory.exe warm $gameDir --jobs 10

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host " Shader Pre-warming Complete! Ready to launch GTA VI." -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
