#!/bin/bash
echo "===================="
echo "   LINUX SYSTEM INFO"
echo "===================="
echo "OS Version:"
lsb_release -a 2>/dev/null || cat /etc/os-release
echo

echo "===================="
echo "   BATTERY STATUS   "
echo "===================="
# Works on laptops only
if command -v upower >/dev/null; then
  BAT=$(upower -e | grep BAT)
  if [ -n "$BAT" ]; then
    upower -i $BAT | grep -E "state|to\ full|percentage|cycle|capacity"
  else
    echo "No battery detected."
  fi
else
  echo "upower not installed (install with: sudo apt install upower)"
fi
echo

echo "===================="
echo "   CPU / MEMORY     "
echo "===================="
echo "CPU Info:"
lscpu | grep -E "Model name|CPU\(s\)|Thread|MHz|Architecture"
echo
echo "Memory Info:"
free -h
echo

echo "===================="
echo "   TEMPERATURE      "
echo "===================="
if command -v sensors >/dev/null; then
  sensors | grep -E "temp|Core"
else
  echo "sensors not installed (install with: sudo apt install lm-sensors)"
fi
echo

echo "===================="
echo "   TOP PROCESSES    "
echo "===================="
ps -eo %cpu,%mem,comm --sort=-%cpu | head -n 10

