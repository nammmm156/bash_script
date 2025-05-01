#!/bin/bash

filepath="/home/ducnam/user.txt"

if [ ! -f "$filepath" ]
then
	echo "file not found!"
	exit 1
fi

while read -r user password 
do
	if [[ -z "$user" || -z "$password" ]]
	then
		continue
	fi
	
	id "$user" > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
		echo ""$user" existed!"
	else
		if [ -d /home/$user ]
		then
			rm -rf /home/$user
			echo rm $user directory success!
		fi
		useradd -m "$user"
		echo "$user:$password" | chpasswd
		echo add "$user" success!
	fi
done < "$filepath"
