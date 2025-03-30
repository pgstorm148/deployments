#!/bin/bash
URL="http://localhost:8080"
if curl --silent --fail $URL; then
    echo "Application is up and running"
else
    echo "Application is DOWN! Check immediately."
fi
