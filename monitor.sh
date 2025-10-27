#!/bin/bash

# Timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# File to store report
log_file="system_report-$(date +'%Y-%m-%d-%H-%M-%S').log"

echo "System Health Report - $timestamp" >> $log_file
echo "-----------------------------------" >> $log_file
echo "" >> $log_file

# CPU Usage
echo "CPU Usage:" >> $log_file
top -bn1 | grep "Cpu(s)" >> $log_file
echo "" >> $log_file

# Memory Usage
echo "Memory Usage:" >> $log_file
free -h >> $log_file
echo "" >> $log_file

# Disk Usage
echo "Disk Usage:" >> $log_file
df -h >> $log_file
echo "" >> $log_file

# Top 5 Processes
echo "Top 5 Processes:" >> $log_file
ps aux --sort=-%mem | head -n 6 >> $log_file
echo "" >> $log_file

# Logged in users
echo "Logged in users:" >> $log_file
who >> $log_file
echo "" >> $log_file

# System Uptime
echo "System Uptime:" >> $log_file
uptime >> $log_file
echo "" >> $log_file

echo "Report generated and saved to $log_file"

