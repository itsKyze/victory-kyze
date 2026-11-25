# Launcher for Victory-Kyze (Pure Standalone Mode, Fully Optimized for GTX 1650 & Ryzen 5 5600G)
Set-Location -Path $PSScriptRoot

$env:RUST_LOG = "warn,victory_gpu::descriptor::host=off,victory_gpu::host=info,victory_gpu::pipeline=info"

# --- Dedicated Native Storage & Cache Directories ---
$env:VICTORY_CACHE_DIR = "$env:LOCALAPPDATA\victory\cache"
$env:VICTORY_DATA_DIR = "$env:LOCALAPPDATA\victory\data"

# Ensure directories exist
if (-not (Test-Path $env:VICTORY_CACHE_DIR)) { New-Item -ItemType Directory -Path $env:VICTORY_CACHE_DIR -Force | Out-Null }
if (-not (Test-Path $env:VICTORY_DATA_DIR)) { New-Item -ItemType Directory -Path $env:VICTORY_DATA_DIR -Force | Out-Null }

# --- NVIDIA GPU Architecture Wave Tuning ---
# NVIDIA Turing (GTX 1650) executes in 32-thread warps.
$env:VICTORY_HOST_WAVE = "32"

# --- CPU Multithreading for Ryzen 5 5600G (6 Cores / 12 Threads) ---
# 10 worker threads for instantaneous pipeline compilation
$env:VICTORY_PIPELINE_WORKERS = "10"

# --- VRAM Allocation (GTX 1650: 3.84 GB Dedicated GDDR5) ---
# Card buffers (geometry/constant buffers in VRAM): 512 MB
$env:VICTORY_CARD_BUFFERS_MB = "512"
$env:VICTORY_CARD_REHASH_RUNS = "1"

# Textures budget: 1800 MB (leaves 1200+ MB headroom for D3D12 allocators, targets, DWM, and driver heaps)
$env:VICTORY_TEXTURE_BUDGET_MB = "1800"
$env:VICTORY_CARD_ROOM_FOR_TARGETS_MB = "400"

# --- Texture Streaming & Staging Throughput (Fixes Blurry/Minecraft Faces) ---
# 64 MB staging capped at 16 ms per frame to prevent VRAM spikes and frametime drops
$env:VICTORY_TEXTURE_STAGE_MB = "64"
$env:VICTORY_TEXTURE_STAGE_MS = "16"
$env:VICTORY_TEXTURE_CATCHUP = "0"
$env:VICTORY_TEXTURE_NO_WAIT = "1"
$env:VICTORY_HEAP_RECHECK = "0"

# --- Memory Watch & Kernel Cache Optimization ---
$env:VICTORY_VIEW_KNOWN = "1"
$env:VICTORY_ASK_ONCE = "1"
$env:VICTORY_PAGE_WRITES = "guards"

# --- Indirect Draw Clamping Batching ---
$env:VICTORY_INDIRECT_WINDOW = "1"

# --- Pipeline Compilation Waiting (Eliminates Black Screen & Dropped Draws) ---
# Wait up to 1500 ms for missing shaders so 3D world geometry is never dropped!
$env:VICTORY_PIPELINE_WAIT_MS = "1500"
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

# --- DirectStorage & Ambient Lighting ---
$env:VICTORY_AMBIENT = "1.2"
$env:VICTORY_AMBIENT_TINT = "1.0,0.95,0.85"
$env:VICTORY_DSTORAGE_RETRIES = "60"

# --- Resolution & Display ---
$env:VICTORY_DISPLAY_MODE = "1280x720"
$env:VICTORY_WINDOW_MAX = "1280x720"

Write-Host ">>> Launching GTA VI via Victory-Kyze (Pure Standalone 720p Mode)..." -ForegroundColor Cyan
Write-Host ">>> Wave: 32 | Workers: 10 | Texture Budget: 2400 MB | Pipeline Wait: 1500ms" -ForegroundColor Gray
.\target\release\victory.exe run --console series-x --unimplemented trap --execute D:\GTA6.Xbox.v1.0.2.1-CYBERLEEK\game_scarlett_master.exe
