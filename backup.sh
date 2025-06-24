#!/bin/bash

sourcedir="/home/ducnam"
desdir="/backup/tarfile"
expire=10 
time=$(date +"%Y-%m-%d_%H-%M-%S")
name="backup_${time}.tar.gz"
path="${desdir}/${name}"
mkdir -p "$desdir"
echo "Starting backup of ${sourcedir} to ${path}"
tar -czvf "$path" "$sourcedir"
echo "Backup finished successfully."
