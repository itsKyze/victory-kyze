# Launcher for Victory-Kyze (Optimized for NVIDIA GeForce & Modern GPUs)
Set-Location -Path $PSScriptRoot

$env:RUST_LOG = "warn,victory_gpu::descriptor::host=off,victory_gpu::host=info,victory_gpu::pipeline=info"
$env:VICTORY_RELAY = "2"
$env:VICTORY_QUEUE2 = "1"
$env:VICTORY_ASYNC_SUBMIT = "1"
$env:VICTORY_COPY_PLAIN = "1"
$env:VICTORY_TEXTURE_NO_WAIT = "1"
$env:VICTORY_CARD_BUFFERS_MB = "1024"
$env:VICTORY_TEXTURE_BUDGET_MB = "5120"
$env:VICTORY_PAGE_WRITES = "slots"
$env:VICTORY_AMBIENT = "0.8"
$env:VICTORY_AMBIENT_TINT = "1.0,0.95,0.85"
$env:VICTORY_PIPELINE_WAIT_MS = "1500"
$env:VICTORY_WIDE_REFRESH = "1"
$env:VICTORY_WIDE_MERGE = "1"
$env:VICTORY_JOIN_COPIES = "1"
$env:VICTORY_DSTORAGE_RETRIES = "60"
$env:VICTORY_DISPLAY_MODE = "1280x720"
$env:VICTORY_WINDOW_MAX = "1280x720"

Write-Host ">>> Launching GTA VI via Victory-Kyze (NVIDIA GTX 1650 & Discrete GPU Engine)..." -ForegroundColor Cyan
.\target\release\victory.exe run --execute D:\GTA6.Xbox.v1.0.2.1-CYBERLEEK\game_scarlett_master.exe *>&1 | Tee-Object -FilePath "last_run.log"
