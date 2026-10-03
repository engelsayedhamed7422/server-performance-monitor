#!/bin/bash

echo "========================================"
echo "        SERVER PERFORMANCE STATS"
echo "========================================"

echo
echo "===== OS Information ====="
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'

echo
echo "===== Uptime ====="
uptime -p

echo
echo "===== CPU Usage ====="
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'

echo
echo "===== Memory Usage ====="
free -h

echo
echo "===== Disk Usage ====="
df -h /

echo
echo "===== Top 5 CPU Processes ====="
ps aux --sort=-%cpu | head -6

echo
echo "===== Top 5 Memory Processes ====="
ps aux --sort=-%mem | head -6

echo
echo "===== Load Average ====="
uptime | awk -F'load average:' '{print $2}'

echo
echo "===== Logged-in Users ====="
who

echo
echo "========================================"
echo "             END OF REPORT"
echo "========================================"
