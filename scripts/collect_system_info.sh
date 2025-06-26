#!/bin/bash

OUTPUT_FILE="/home/ubuntu/resp_htop.log"

# Get memory information
MEM_INFO=$(free -m | grep Mem)
TOTAL_MEM=$(echo $MEM_INFO | awk '{print $2}')
USED_MEM=$(echo $MEM_INFO | awk '{print $3}')
MEM_PERCENT=$(echo "scale=2; $USED_MEM*100/$TOTAL_MEM" | bc)

# Get processor count
PROC_COUNT=$(nproc)

# Get running nginx tasks
NGINX_TASKS=$(ps aux | grep nginx | grep -v grep | wc -l)

# Get system load average
LOAD_AVG=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')

# Get uptime
UPTIME=$(uptime -p)

# Write to output file
echo "Total de Memoria del sistema y % utilizado: ${TOTAL_MEM}MB, ${MEM_PERCENT}%" > $OUTPUT_FILE
echo "Cantidad de núcleos de procesamiento: $PROC_COUNT" >> $OUTPUT_FILE
echo "Cantidad de tareas en ejecución de Nginx: $NGINX_TASKS" >> $OUTPUT_FILE
echo "Carga Promedio del sistema: $LOAD_AVG" >> $OUTPUT_FILE
echo "Uptime del sistema: $UPTIME" >> $OUTPUT_FILE
