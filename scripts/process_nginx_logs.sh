#!/bin/bash

LOG_FILE="/home/ubuntu/nginx_test.log"
OUTPUT_FILE="/home/ubuntu/resp_nginx.log"

# Get total records
TOTAL_RECORDS=$(wc -l < $LOG_FILE)

# Get records with HTTP status code 200
STATUS_200=$(awk  '$7  == "200"' /home/ubuntu/nginx_test.log | wc -l)

# Get records from specific timestamp
TIMESTAMP_RECORDS=$(grep -c '2022-02-04T16:21' $LOG_FILE)

# Get records with specific user agent
USER_AGENT_RECORDS=$(grep -c 'Dalvik/2.1.0 (Linux; U; Android 9; WOM Build/PI)' $LOG_FILE)

# Write results to output file
echo "Cantidad total de registros: $TOTAL_RECORDS" > $OUTPUT_FILE
echo "Cantidad de registros con HTTP STATUS CODE = 200: $STATUS_200" >> $OUTPUT_FILE
echo "Cantidad de registros registrados con timestamp 2022-02-04T16:21: $TIMESTAMP_RECORDS" >> $OUTPUT_FILE
echo "Cantidad de registros con HTTP USER AGENT = Dalvik/2.1.0 (Linux; U; Android 9; WOM Build/PI): $USER_AGENT_RECORDS" >> $OUTPUT_FILE

# Create a file with the last 1500 lines
tail -1500 $LOG_FILE > /home/ubuntu/nginx_sub.log
