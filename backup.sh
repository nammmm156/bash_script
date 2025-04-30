#!/bin/bash

sourcedir="/home/ducnam"
desdir="/backup/tarfile"
expire=10
time=$(date +"%Y-%m-%d_%H-%M-%S")
name="backup_$(time).tar.gz"
path="$(desdir)/$(name)"
mkdir -p "$desdir"
tar -czvf "$path" "$sourcedir"
