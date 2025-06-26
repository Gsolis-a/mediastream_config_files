#!/bin/bash

LOG_FILE="/mediastream/recolecta_info.log"

# Get current timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Append timestamp to log file
echo "=== $TIMESTAMP ===" >> $LOG_FILE

# Last 3 lines of syslog
echo "Last 3 lines of /var/log/syslog:" >> $LOG_FILE
tail -3 /var/log/syslog >> $LOG_FILE

# Disk space usage
echo -e "\nDisk space usage on RAID:" >> $LOG_FILE
df -h /mediastream >> $LOG_FILE

# Generate hash of auth.log
echo -e "\nHash of /var/log/auth.log:" >> $LOG_FILE
sha256sum /var/log/auth.log >> $LOG_FILE
echo "" >> $LOG_FILE
