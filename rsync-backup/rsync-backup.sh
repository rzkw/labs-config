#!/bin/bash
# Script to backup directories of acerubuntuserver to mounted USB stick/logical volume

# Set variables, destination directory, origin directories (some require root access)

date=$(date +%Y-%m-%d)
time=$(date +%T)
backupdir="/media/acer-backup"
origin="/etc /home /root /var /usr/local/bin /usr/local/sbin /srv /opt"

# Checks if user is running script as root 

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root/use sudo"
	exit
fi

mkdir -p "$backupdir/$date-$time"

echo "Backing up directories to /media/acer-backup"

# Backup: create archive; recursive into dirs; verbose; update only files that are older; compress files during transfer

rsync -arvuz -delete -stats $origin "$backupdir"/"$date-$time" 

echo "Backup complete"
