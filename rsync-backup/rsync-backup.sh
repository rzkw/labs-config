#!/bin/bash
#Script to backup /etc of acerubuntuserver to external (local) ssd

date=$(date +%Y.%m.%d.%H.%M.%S)
backupdir="/media/backup-acer"
origin="/etc/alloy   /etc/containerd   /etc/docker   /etc/fail2ban   /etc/initramfs-tools   /etc/nginx   /etc/selinux   /etc/ssh   /etc/sudoers   /etc/sudoers.d   /etc/ufw   /etc/passwd   /etc/group   /etc/shadow   /etc/gshadow   /etc/crontab   /etc/cron.d   /etc/cron.daily   /etc/cron.hourly   /etc/cron.weekly   /etc/cron.monthly"

mkdir $backupdir/$date

echo "Backing up /etc core directories to /media/backup-acer/etc-core"

rsync -arvuz --dry-run -delete -progress -stats $origin "$backupdir"/"$date"

echo "Backup complete"
