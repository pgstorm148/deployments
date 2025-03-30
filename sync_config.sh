#!/bin/bash
SOURCE_DIR="/etc/myapp/config"
DESTINATION_SERVERS=("server1" "server2")
for SERVER in "${DESTINATION_SERVERS[@]}"; do
    rsync -avz $SOURCE_DIR/ $SERVER:$SOURCE_DIR/
    echo "Configuration synced to $SERVER"
done
