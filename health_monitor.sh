#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2+$4)}')
if [ $CPU_USAGE -gt $CPU_THRESHOLD ]; then
  echo "ALERT: CPU usage ${CPU_USAGE}% exceeds threshold ${CPU_THRESHOLD}%"
else
  echo "CPU usage: ${CPU_USAGE}%"
fi

# Memory usage
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ $MEM_USAGE -gt $MEM_THRESHOLD ]; then
  echo "ALERT: Memory usage ${MEM_USAGE}% exceeds threshold ${MEM_THRESHOLD}%"
else
  echo "Memory usage: ${MEM_USAGE}%"
fi

# Disk usage
DISK_USAGE=$(df / | tail -1 | awk '{print int($5)}')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
  echo "ALERT: Disk usage ${DISK_USAGE}% exceeds threshold ${DISK_THRESHOLD}%"
else
  echo "Disk usage: ${DISK_USAGE}%"
fi

# Top 5 processes by CPU
echo "Top 5 processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
