#!/bin/bash
LOAD=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1)
if (( $(echo "$LOAD > 5.0" | bc -l) )); then
    echo "High load detected! Adding more instances..."
    aws autoscaling start-instance-refresh --auto-scaling-group-name my-app-asg
fi
