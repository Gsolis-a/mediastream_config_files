#!/bin/bash

# Set the date format
DATE=$(date +"%Y-%m-%d_%H-%M")

# Set backup directory
BACKUP_DIR="/mediastream"

# Log file
LOG_FILE="/var/log/mongo_backup.log"

# Start the backup process
echo "$(date) - Starting MongoDB backup" >> $LOG_FILE

# Create backup
mongodump --out="$BACKUP_DIR/mongodb_backup_$DATE"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "$(date) - MongoDB backup successful: $BACKUP_DIR/mongodb_backup_$DATE" >> $LOG_FILE
else
    echo "$(date) - Error: MongoDB backup failed!" >> $LOG_FILE
fi
