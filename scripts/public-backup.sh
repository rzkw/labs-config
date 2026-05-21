#!/bin/bash

message="New backup $(date)"

#Add all files to queue
git add .

#Add new commit with today's date and time
echo "Creating a new backup: $(date)"
git commit -m "$message"

#Ensure branch is up to date
git fetch origin

#Pull remote branch, rearrange local edits on top
git pull --rebase

#Push to main
echo "Pushing the files to repo"
git push origin main
