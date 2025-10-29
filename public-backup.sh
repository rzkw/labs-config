#!/bin/bash

#Ensure branch is up to date
git fetch origin

#Pull remote branch, rearrange local edits on top
git pull --rebase

# Add all files to queue
git add .

# Name the commit
message=`date`

# Add a new commit with today's date and time
echo "Creating a new commit: backup: $(date)"
git commit -m "$message"

#Push to main
echo "Pushing the files to repo"
git push --force-with-lease origin main
