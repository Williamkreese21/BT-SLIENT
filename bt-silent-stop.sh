cat > bt-silent-stop.sh << 'EOF'
#!/bin/bash
echo "[*] Stopping all Bluetooth attacks..."
pkill l2ping 2>/dev/null
pkill -f bt-silent 2>/dev/null
sleep 1
echo "[OK] All stopped"
EOF
