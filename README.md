# Victory-Kyze

Custom Xbox Series runtime fork optimized for stability, VRAM management, and performance monitoring (with built-in Performance Overlay HUD).

Maintained by [itsKyze](https://github.com/itsKyze).

---

## English Guide

### 1. Prerequisites
- Windows 10/11 (64-bit)
- [Rust](https://rustup.rs/) + Visual Studio C++ Build Tools
- Your own local Xbox Series game dump containing `game_scarlett_master.exe` (not included)

### 2. Where to Set Your Game Path
Open `run_victory_kyze.ps1` and edit the last line to point to your `game_scarlett_master.exe`:
```powershell
.\target\release\victory.exe run --console series-x --unimplemented trap --execute "D:\YOUR_GAME_FOLDER\game_scarlett_master.exe"
```

### 3. Build & Run
```powershell
git clone https://github.com/itsKyze/victory-kyze.git
cd victory-kyze
cargo build --release
powershell -ExecutionPolicy Bypass -File .\run_victory_kyze.ps1
```

### 4. GPU Compatibility (Strong GPUs vs 4 GB GPUs)
- **Strong GPUs (8 GB / 12 GB / 16 GB+ VRAM — e.g. RTX 3060 12GB, RTX 4070, RX 6700 XT, RTX 4090) + 32 GB RAM**:
  Yes, it runs much better and more stably. Open `run_victory_kyze.ps1` and increase the VRAM budget:
  ```powershell
  $env:VICTORY_TEXTURE_BUDGET_MB = "4000"   # or "6000" for 12GB+ cards
  $env:VICTORY_CARD_BUFFERS_MB = "1024"
  ```
- **4 GB VRAM GPUs (e.g. GTX 1650)**:
  Uses the default low-VRAM profile (`1500 MB` textures, `384 MB` buffers). Menus and opening cutscenes work, but open-world gameplay requires 8 GB+ VRAM and 32 GB RAM.

### 5. Controls & Overlay
- **F10**: Show / Hide Performance Overlay (FPS, Draws, CPU, RAM, VRAM)
- **Space / Enter / F1**: Button A (hold 3–5s to skip cutscenes)
- **WASD / IJKL**: Left Stick / Right Stick (Camera)
- **Esc**: Menu | **Backspace**: B | **Z / C**: Triggers

---

## الدليل بالعربية

### 1. المتطلبات
- نظام Windows 10/11 (64-bit)
- تثبيت [Rust](https://rustup.rs/) وأدوات Visual Studio C++
- مجلد اللعبة الخاص بك الذي يحتوي على `game_scarlett_master.exe` (غير مرفق)

### 2. أين تضع مسار اللعبة؟
افتح ملف `run_victory_kyze.ps1` وعدّل السطر الأخير ليطابق مسار `game_scarlett_master.exe` على جهازك:
```powershell
.\target\release\victory.exe run --console series-x --unimplemented trap --execute "D:\YOUR_GAME_FOLDER\game_scarlett_master.exe"
```

### 3. البناء والتشغيل
```powershell
git clone https://github.com/itsKyze/victory-kyze.git
cd victory-kyze
cargo build --release
powershell -ExecutionPolicy Bypass -File .\run_victory_kyze.ps1
```

### 4. هل تشتغل على الكروت القوية؟
- **نعم، الكروت القوية (8 GB / 12 GB / 16 GB+ VRAM مثل RTX 3060 12GB أو RTX 4070 أو RX 6700 XT) مع 32 GB RAM**:
  تعمل بشكل أفضل وأكثر استقرارا بكثير. فقط افتح `run_victory_kyze.ps1` وارفع ميزانية الذاكرة:
  ```powershell
  $env:VICTORY_TEXTURE_BUDGET_MB = "4000"   # أو 6000 لكروت 12GB+
  $env:VICTORY_CARD_BUFFERS_MB = "1024"
  ```
- **كروت 4 GB VRAM (مثل GTX 1650)**:
  تعمل بالإعدادات المخففة الافتراضية (`1500 MB` للـ Textures)، وتدخل القوائم والمشهد الأول، لكن العالم المفتوح يتطلب 8 GB VRAM فأكثر و 32 GB RAM.

### 5. التحكم ولوحة الأداء
- **F10**: إظهار / إخفاء لوحة الأداء (FPS، Draws، RAM، VRAM)
- **Space / Enter / F1**: زر A (اضغط باستمرار 3–5 ثوانٍ لتخطي المشاهد)
- **WASD / IJKL**: الحركة / الكاميرا
- **Esc**: القائمة | **Backspace**: زر B | **Z / C**: Triggers
