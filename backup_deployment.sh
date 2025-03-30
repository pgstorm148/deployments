#!/bin/bash
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/backups"
DATE=$(date +"%Y%m%d")
tar -czf $BACKUP_DIR/deployment_$DATE.tar.gz $SOURCE_DIR
echo "Backup created at $BACKUP_DIR/deployment_$DATE.tar.gz"
