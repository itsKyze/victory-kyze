# Launcher for Victory-Kyze (Optimized for NVIDIA GeForce GTX 1650 & 4 GB VRAM)
Set-Location -Path $PSScriptRoot

$env:RUST_LOG = "warn,victory_gpu::descriptor::host=off,victory_gpu::host=info,victory_gpu::pipeline=info"

# --- VRAM Allocation (GTX 1650: 3.84 GB VRAM Balanced Budget) ---
# Card buffers (geometry/constant buffers in VRAM): 1024 MB
$env:VICTORY_CARD_BUFFERS_MB = "1024"
$env:VICTORY_CARD_REHASH_RUNS = "1"

# Textures budget: Allow 2560 MB so high-res face/world textures load (fixes Minecraft/blurry faces)
$env:VICTORY_TEXTURE_BUDGET_MB = "2560"
# Room for render targets: 768 MB (prevents artificial early texture lockout)
$env:VICTORY_CARD_ROOM_FOR_TARGETS_MB = "768"

# --- Texture Streaming & Staging Throughput ---
# Increase staging throughput so textures and facial details load immediately without queue backlog
$env:VICTORY_TEXTURE_STAGE_MB = "128"
$env:VICTORY_TEXTURE_STAGE_MS = "40"
# Enable catchup so initial texture burst loads 3x faster
$env:VICTORY_TEXTURE_CATCHUP = "1"
$env:VICTORY_TEXTURE_NO_WAIT = "1"
$env:VICTORY_HEAP_RECHECK = "0"

# --- Memory Watch & Kernel Cache Optimization ---
# Cache view memory knowledge to eliminate hundreds of slow VirtualQuery page-table walks per frame
$env:VICTORY_VIEW_KNOWN = "1"
$env:VICTORY_ASK_ONCE = "1"
# Do NOT set VICTORY_PAGE_WRITES to 'slots' (which flooded the queue with 18,000 slots and caused 490ms drops)
$env:VICTORY_PAGE_WRITES = "guards"

# --- Indirect Draw Clamping Batching (Massive FPS boost during gameplay mesh draws) ---
# Batches 3,400+ per-frame mesh draw record clamps into scratch buffers instead of per-draw compute dispatch stalls
$env:VICTORY_INDIRECT_WINDOW = "1"

# --- Pipeline & Shaders ---
# Wait up to 500ms for asynchronous shader compilation so zero draws are dropped
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

Write-Host ">>> Launching GTA VI via Victory-Kyze (Optimized Texture & FPS Mode)..." -ForegroundColor Cyan
.\target\release\victory.exe run --execute D:\GTA6.Xbox.v1.0.2.1-CYBERLEEK\game_scarlett_master.exe *>&1 | Tee-Object -FilePath "last_run.log"
