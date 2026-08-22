# Edit 08/08/2026: Script backing up set of dirs from dev server to mounted logical volume. Exits if not run as root. Files in destination deleted if no longer in source. 
#
# Installed as systemd service with scheduled timer, logs through journalctl. 
#
# References: https://wellquite.org/posts/backups/; https://www.youtube.com/watch?v=5pzUM4CEtaY
#
# Full writeup: https://medium.com/@walkable-llc/scheduled-backups-with-rsync-e06725246df4


#!/bin/bash

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
