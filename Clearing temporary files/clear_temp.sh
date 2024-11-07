#!/bin/bash

TEMP_DIR="/path/to/temp"
find "$TEMP_DIR" -type f -mtime +7 -exec rm -f {} \;
echo "Temporary files older than 7 days have been deleted"
