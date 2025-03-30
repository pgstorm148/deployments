#!/bin/bash
DOMAIN="example.com"
EXPIRY_DAYS=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -enddate | awk -F= '{print $2}' | xargs -I{} date -d "{}" +%s)
CURRENT_DATE=$(date +%s)
DAYS_LEFT=$(( ($EXPIRY_DAYS - $CURRENT_DATE) / 86400 ))
if [ $DAYS_LEFT -lt 30 ]; then
    echo "Warning! SSL certificate for $DOMAIN expires in $DAYS_LEFT days."
fi
