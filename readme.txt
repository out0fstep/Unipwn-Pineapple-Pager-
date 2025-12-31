<p align="center">
  <img src="https://raw.githubusercontent.com/out0fstep/Unipwn-Pineapple-Pager-/main/banner.png" alt="UniPwn Banner">
</p>

<h1 align="center">🐍 UniPwn Pineapple Pager Port</h1>
<p align="center"><i>A port of Bin4ry's UniPwn BLE RCE exploit adapted for the Hak5 Pineapple Pager</i></p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Pineapple_Pager-black?style=flat-square">
  <img src="https://img.shields.io/badge/Status-Active-green?style=flat-square">
  <img src="https://img.shields.io/badge/Use-Pentesting_only-red?style=flat-square">
</p>

---

> ⚠️ This tool is intended **only for authorized pentesting and research.**  
> The author is **not responsible for misuse, damages, or illegal activity.**

---

## ✨ Features

- **Automated BLE Hunting** – background scanner, ~10m detection
- **Remote Command Execution** – reboot, enable SSH, or inject custom payloads
- **Native Pineapple Integration**  
  - DuckyScript alerts  
  - LED + ringtone feedback  
  - Loot logging to `/root/loot/`
- **Self-Cleaning Exploit Cache**
- **Scan/Exploit Loops with Configurable Timing**
- **Multi-Device Logging & First-Target Execution**

---

<p align="center">
  <img src="https://raw.githubusercontent.com/out0fstep/Unipwn-Pineapple-Pager-/main/image.jpg" alt="Pager Screenshot" width="450">
</p>

---

## 🧩 Requirements

### Hardware
- Hak5 **WiFi Pineapple Pager**

### Packages

```bash
opkg install git
opkg install python3 python3-pip
opkg install bluez-utils
pip install bleak
