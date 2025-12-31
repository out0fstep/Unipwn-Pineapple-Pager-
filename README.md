<p align="center">
  <img src="https://raw.githubusercontent.com/out0fstep/Unipwn-Pineapple-Pager-/main/banner.png" alt="UniPwn Banner">
</p>

<h1 align="center"> UniPwn Robot Hunter</h1>
<p align="center"><i>A port of Bin4ry's UniPwn BLE RCE exploit adapted for the Hak5 Pineapple Pager</i></p>

<div align="center">

-=[ **Created by** · [out0fstep](https://github.com/out0fstep) ]=-  

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![☕️ Buy Me a Coffee](https://img.shields.io/badge/%E2%98%95%EF%B8%8F-Buy%20Me%20a%20Coffee-yellow)](https://buymeacoffee.com/out0fstep)
[![Follow @DorkfeastTeam](https://img.shields.io/badge/follow-@DorkfeastTeam-1DA1F2?logo=x&logoColor=white)](https://x.com/DorkfeastTeam)

**Ḥą̥̥̍c̷̙̆k̘̝̰̭ T̻ȟ̔̓̀e̛̪̒̌ P̡̢̼̂l̟̑̀a̭n̨̹̖̆e̯̍ṯ̎̕!̶̐̒**

</div>

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

### I put the file in [ root/payloads/users/unipwn/payload.sh ]
