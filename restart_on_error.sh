#!/bin/bash
LOG_FILE="/var/log/myapp/error.log"
SERVICE="myapp"
if grep -qi "fatal error" $LOG_FILE; then
    echo "Error detected! Restarting $SERVICE..."
    systemctl restart $SERVICE
fi
