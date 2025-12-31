<p align="center">
  ![UniPwn Banner](https://github.com/out0fstep/Unipwn-Pineapple-Pager-/blob/main/banner.png?raw=true)
</p>

# 🐍 UniPwn Pineapple Pager Port  

> A port of **Bin4ry's UniPwn BLE RCE exploit** to the **Hak5 Pineapple Pager**.  
This automated payload scans for vulnerable **Unitree robots** (**Go2, G1, H1, B2, X1**) over BLE, detects units within ~10m, and **executes remote commands automatically** (reboot, SSH enable, or custom injection).  

⚠️ For **authorized pentesting/red team use only.**

## ✨ Features  

- **Automated BLE Hunting** – Background loop, 20s scans every 60s.  
- **Non-Interactive Exploit Execution** – Cleans UniPwn cache & executes commands without user input.  
- **Native Pineapple Integration** – Uses **DuckyScript alerts, LED, Ringtone**, logs to `/root/loot/`.  
- **Configurable Runtime** – Adjust scan cycle, target commands, infinite run mode, etc.  
- **Dependency Validation + Fail-Safe Exit Handling**  
- **Multi-Target Capable** – Logs all devices, exploits first viable unit.  

---
<p align="center">
  ![UniPwn Banner](https://github.com/out0fstep/Unipwn-Pineapple-Pager-/blob/main/image.jpg?raw=true)
</p>
---

## 📦 Requirements  

**Hardware**
- Hak5 **WiFi Pineapple Pager**

**Software Packages**
```bash
opkg install git
opkg install python3 python3-pip
opkg install bluez-utils
pip install bleak

