#!/bin/bash
EMAIL="team@example.com"
echo "Deployment completed successfully!" | mail -s "Deployment Notification" $EMAIL
