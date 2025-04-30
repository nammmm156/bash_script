#!/bin/bash

user="ducnam"
ip="192.168.6.111"
src="/home/ducnam/alert.txt"
dest="/home/ducnam/log"

date=$(date +"%Y-%m-%d_%H-%M-%S")
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
ram_usage=$(free -h | grep Mem | awk '{print $4}' | cut -c1-3)
ram_total=$(free -h | grep Mem | awk '{print $2}' | cut -c1-3)
ram_percent=$(echo "scale=2; $ram_usage / $ram_total * 100" | bc)
storage_percent=$(df | awk 'NR>1 {total += $2; used += $3} END {if (total > 0) print ((total - used) / total) *100; else print 0}')

report="$date
	cpu: $cpu_usage
	ram: $ram_percent
	disk: $storage_percent"
echo $report > $src

scp "$src" "$user@$ip:$dest"

