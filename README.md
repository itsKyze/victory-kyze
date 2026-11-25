# Victory-Kyze

> **English** | [**العربية (Arabic) أدناه**](#arabic)

**Victory-Kyze** is a high-performance native DirectX 12.X compatibility runtime designed to execute Xbox Series X|S titles (specifically GTA VI Scarlett builds) directly on Windows without heavy hypervisor or virtualization overhead.

This fork incorporates critical enhancements specifically tailored for **NVIDIA GeForce (GTX 1650 & RTX series)** and modern PC hardware architectures.

---

## Key Features & Enhancements

- 🚀 **NVIDIA Discrete GPU Priority**: Intelligent DXGI adapter selection that automatically binds dedicated GPUs (NVIDIA GTX/RTX) rather than integrated APUs.
- 🛡️ **Engine Assert & Suicide Trap Neutralization**: Patched Vectored Exception Handling (VEH) that intercepts and safely bypasses hardcoded game assertions (`0x80000003` / `int3` breakpoints and NULL page write suicides), enabling smooth transition into the live 3D world.
- ⚡ **Anti-Hang Win32 Message Pump**: Embedded asynchronous Win32 message dispatcher during shader pipeline translation, completely preventing Windows DWM `[Not Responding]` white-screen freezes.
- 💾 **DirectStorage Physical Page Write Resiliency**: Tolerant physical page mapping for seamless world streaming without `E_INVALIDARG` aborts.
- 🎨 **Lighting & Depth Emulation**: Emulated `OMSetDepthBounds` and ambient depth illumination presets for realistic in-game rendering.

---

## Requirements

- **OS**: Windows 10 / 11 (64-bit, 22H2 or newer)
- **CPU**: Modern x86-64 processor (AMD Ryzen or Intel Core with AVX2)
- **RAM**: 16 GB RAM + 32 GB Pagefile recommended
- **GPU**: NVIDIA GeForce GTX 1650 (4 GB) or higher (RTX series recommended), or AMD Radeon RDNA 2/3/4
- **Toolchain**: Rust (stable), MSVC C++ Build Tools, Windows SDK (DirectX 12 Agility SDK / SM 6.6)

---

## Quick Start

### 1. Build from Source
```powershell
cargo build --release --bin victory
```

### 2. Run
```powershell
.\run_victory_kyze.ps1
```

---

<a name="arabic"></a>
# بالعربية (Arabic)

**Victory-Kyze** هو مشروع تشغيل وتوافقية DirectX 12.X لألعاب Xbox Series X|S (وبشكل خاص GTA VI Scarlett Master) مباشرة على نظام Windows دون الحاجة لمحاكي افتراضي ثقيل.

هذه النسخة مخصصة ومعدلة لدعم كروت الشاشة **NVIDIA GeForce (GTX 1650 وسلسلة RTX)** والأجهزة المتوسطة والحديثة.

### أهم التحسينات المضافة:
1. **التعرف التلقائي على كرت الشاشة المنفصل (NVIDIA Discrete GPU)** عبر DXGI واختياره بدلاً من الكرت المدمج.
2. **تخطي كراشات واختناقات محرك اللعبة (Engine Asserts Bypass)**: منع كراش `0x80000003` وتعليمات `int3` عند الدخول إلى العالم ثلاثي الأبعاد.
3. **منع تجمد الشاشة (Anti-Freeze Message Pump)**: معالجة رسائل النظام باستمرار أثناء تجميع الشيدرز، لمنع ظهور الشاشة البيضاء أو عبارة `[Not Responding]`.
4. **تحسين تدفق الذاكرة وموارد DirectStorage** لمنع امتلاء الـ VRAM والرامات بشكل مفاجئ.

### طريقة التشغيل:
```powershell
.\run_victory_kyze.ps1
```

---

## Credits & License

Built with community research and improvements from the original `VIctory` project. Licensed under MIT / Apache-2.0.
