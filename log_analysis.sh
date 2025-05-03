#!/bin/bash

logfile="/var/log/auth.log"

if [ ! -r "$logfile" ]
then
	echo "khong the truy cap"
	exit 1
fi

echo "nhung ip dang nhap nhieu nhat"
grep -a "sshd" "$logfile" | grep -a "Accepted" | sort | awk '{print $11}' | uniq -c | sort -nr | head
echo

echo "gio dang nhap pho bien nhat"
grep -a "sshd" "$logfile" | grep -a "Accepted" | sort | awk '{print $3}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
echo

echo "nhung lenh sudo duoc dung pho bien nhat"
grep -a "sudo" "$logfile" | grep -a "COMMAND=" | awk '{print $14}' | cut -d= -f2 | sort | uniq -c | head
echo

echo "ip dang nhap fail nhieu nhat (co the la brute force)"
grep -a "Failed password" "$logfile" | awk '{print $11}' | sort | uniq -c | sort -nr | head
echo

echo "nhung user dang nhap fail nhieu nhat(co the la nhung user hay bi brute force)"
grep -a "Failed password" /var/log/auth.log | awk '{print $9}' | sort | uniq -c | sort -nr | head
echo
