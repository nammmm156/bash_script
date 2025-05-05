#!/bin/bash

log_file="/var/log"
echo "don dep cac file log cu hon 7 ngay trong $log_file"

find "$log_file" -type f -name "*.log" -mtime +7 | while read file
do
	rm -f "$file" && echo "xoa $file"
done
echo "hoan thanh don dep"

