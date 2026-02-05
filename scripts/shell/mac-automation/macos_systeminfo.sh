#!/bin/bash
echo "===================="
echo "   MAC SYSTEM INFO  "
echo "===================="
echo "macOS Version:"
sw_vers
echo

echo "===================="
echo "   BATTERY STATUS   "
echo "===================="
pmset -g batt
system_profiler SPPowerDataType | grep -E "Cycle Count|Condition|Maximum Capacity"
echo

echo "===================="
echo "   CPU / MEMORY     "
echo "===================="
top -l 1 | head -n 10
echo

echo "===================="
echo "   TEMPERATURE      "
echo "===================="
osx-cpu-temp
istats
echo

echo "===================="
echo "   TOP PROCESSES    "
echo "===================="
ps -A -o %cpu,%mem,comm | sort -nr | head -n 10

