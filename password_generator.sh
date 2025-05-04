#!/bin/bash

echo "Nhap vao so luong ky tu mat khau ma ban muon: "
read length

if ! [[ $length =~ ^[0-9]+$ ]]
then
	echo "vui long nhap cac so"
	exit 1
fi

if [[ $length -lt 8 ]]
then
	echo "so luong ky tu khong dam bao an toan"
	exit 1
fi

password=$(cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*' | head -c "$length")

echo "mat khau la: $password"

