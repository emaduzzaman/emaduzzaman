#!/bin/bash
# monitor.sh - System health check

echo "===== CPU Usage ====="
mpstat 1 1 | awk '/Average/ {print 100-$NF"%"}'

echo "===== Memory Usage ====="
free -h

echo "===== Disk Usage ====="
df -h | grep -v tmpfs

