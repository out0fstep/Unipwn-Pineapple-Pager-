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

> ⚠️ **Authorized research & pentesting only.**  
> You are responsible for your actions.

---

## ✨ Features

- **Automated BLE Hunting** — background scanning (~10m range)
- **Remote Command Execution**  
  - reboot target  
  - auto-enable SSH  
  - custom payload injection
- **Native Pineapple Integration**
  - DuckyScript alerts  
  - LED + ringtone feedback  
  - Loot logs to `/root/loot/`
- **Self-cleaning exploit cache**
- **Configurable scan/exploit timers**
- **Multi-target logging (exploits first viable)**

---

<p align="center">
  <img src="https://raw.githubusercontent.com/out0fstep/Unipwn-Pineapple-Pager-/main/image.jpg" width="420" alt="Pager Exploit UI">
</p>

---

## 🧩 Requirements

### Hardware
- Hak5 **WiFi Pineapple Pager**

### Software / Packages

```bash
opkg install git
opkg install python3 python3-pip
opkg install bluez-utils
pip install bleak
