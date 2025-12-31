You will need to load the following:

1. git - "opkg install git" &  "opkg install git-http"
2. UniPwn - "git clone https://github.com/Bin4ry/UniPwn.git"
3. python3, python3-pip, Bleak - "opkg update && opkg install python3 python3-pip; pip install bleak"

I put the file in [ root/payloads/users/unipwn/payload.sh ]

start the payload, if you are missing any of the above you will get an error. once everything is correct it will alert you that it is armed and ready to start. it scans for targets for a duration and alerts back if no targets are detected. if a target is detected it should deploy the unipwn poc but i am unable to verify as i do not have a unitree robot to confirm. 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 🐍 UniPwn Pineapple Pager Port  

> A port of **Bin4ry's UniPwn BLE RCE exploit** to the **Hak5 Pineapple Pager**.  
This automated alert payload scans for vulnerable **Unitree robots** (**Go2, G1, H1, B2, X1**) over BLE, detects units within ~10m, and **executes remote commands automatically** (reboot, SSH enable, or custom injection).  

⚠️ For **authorized pentesting/red team use only.**

---

## ⭐ Status
| Stars | Issues | License |
|---|---|---|
| ![stars](https://img.shields.io/github/stars/your/repo) | ![issues](https://img.shields.io/github/issues/your/repo) | ![license](https://img.shields.io/github/license/your/repo) |

---

## 🚀 Quick Demo  
📸 *Drop in a GIF or screenshot here of the payload running on the Pineapple GUI/CLI*

---

## ✨ Features  

- **Automated BLE Hunting** – Background loop, 20s scans every 60s.  
- **Non-Interactive Exploit Execution** – Cleans UniPwn cache & executes commands without user input.  
- **Native Pineapple Integration** – Uses **DuckyScript alerts, LED, Ringtone**, logs to `/root/loot/`.  
- **Configurable Runtime** – Adjust scan cycle, target commands, infinite run mode, etc.  
- **Dependency Validation + Fail-Safe Exit Handling**  
- **Multi-Target Capable** – Logs all devices, exploits first viable unit.  

---

## 📦 Requirements  

**Hardware**
- Hak5 **WiFi Pineapple Pager** with BLE supported dongle  

**Firmware**
- Latest **OpenWRT-based Pineapple OS**

**Software Packages**
```bash
opkg install git
opkg install python3 python3-pip
opkg install bluez-utils
pip install bleak
