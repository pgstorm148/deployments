#!/bin/bash
THRESHOLD=90
SERVICE="myapp"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "CPU usage high! Restarting $SERVICE..."
    systemctl restart $SERVICE
fi
