#!/bin/bash

file_path="/home/ducnam/server_ip.txt"
while read -r host || [[ -n "$host" ]]
do
	if [ -z "$host" ]
	then
		continue
	fi
	ping -c 1 -W 1 "$host" 2>&1 > /dev/null
	if [ $? -eq 0 ]
	then
		echo ""$host" test ok"
	else
		echo ""$host" test fail"
	fi
done < $file_path
