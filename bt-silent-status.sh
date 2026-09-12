cat > bt-silent-status.sh << 'EOF'
#!/bin/bash
if pgrep l2ping >/dev/null; then
    echo "[RUNNING] BT-SILENT is active - Processes: $(pgrep -c l2ping)"
else
    echo "[STOPPED] BT-SILENT is not running"
fi
EOF
