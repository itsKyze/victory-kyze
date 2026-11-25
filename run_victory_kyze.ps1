# Launcher for Victory-Kyze (Optimized for NVIDIA GeForce GTX 1650 & 4 GB VRAM)
Set-Location -Path $PSScriptRoot

$env:RUST_LOG = "warn,victory_gpu::descriptor::host=off,victory_gpu::host=info,victory_gpu::pipeline=info"

# --- VRAM Allocation (GTX 1650: 3.84 GB VRAM Balanced Budget) ---
# Card buffers (geometry/constant buffers in VRAM): 1024 MB (prevents 271 hash passes and 800ms host memory copy stalls)
$env:VICTORY_CARD_BUFFERS_MB = "1024"
$env:VICTORY_CARD_REHASH_RUNS = "1"

# Textures budget in VRAM: 1536 MB (balanced for 4GB VRAM)
$env:VICTORY_TEXTURE_BUDGET_MB = "1536"
$env:VICTORY_CARD_ROOM_FOR_TARGETS_MB = "1024"

# --- Texture Streaming & Staging Throttle ---
$env:VICTORY_TEXTURE_STAGE_MB = "48"
$env:VICTORY_TEXTURE_STAGE_MS = "16"
$env:VICTORY_TEXTURE_CATCHUP = "0"
$env:VICTORY_HEAP_RECHECK = "0"
$env:VICTORY_TEXTURE_NO_WAIT = "1"
$env:VICTORY_PAGE_WRITES = "slots"

# --- Pipeline & Shaders ---
# Wait up to 500ms so DXC finishes compilation and zero draws are dropped (prevents black screen / 0 draws/frame)
$env:VICTORY_PIPELINE_WAIT_MS = "500"
$env:VICTORY_PIPELINE_WAIT_SHARED = "1"

# --- Relay, Queue & Async Presentation ---
$env:VICTORY_RELAY = "2"
$env:VICTORY_LATE_WAIT = "3"
$env:VICTORY_ASYNC_PRESENT = "1"
$env:VICTORY_QUEUE2 = "1"
$env:VICTORY_ASYNC_SUBMIT = "1"
$env:VICTORY_COPY_PLAIN = "1"
$env:VICTORY_WIDE_REFRESH = "1"
$env:VICTORY_WIDE_MERGE = "1"
$env:VICTORY_JOIN_COPIES = "1"

# --- DStorage & Ambient Lighting ---
$env:VICTORY_AMBIENT = "1.2"
$env:VICTORY_AMBIENT_TINT = "1.0,0.95,0.85"
$env:VICTORY_DSTORAGE_RETRIES = "60"

# --- Resolution ---
$env:VICTORY_DISPLAY_MODE = "1280x720"
$env:VICTORY_WINDOW_MAX = "1280x720"

Write-Host ">>> Launching GTA VI via Victory-Kyze (Optimized GTX 1650 Mode)..." -ForegroundColor Cyan
.\target\release\victory.exe run --execute D:\GTA6.Xbox.v1.0.2.1-CYBERLEEK\game_scarlett_master.exe *>&1 | Tee-Object -FilePath "last_run.log"
