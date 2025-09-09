#!/bin/bash

# Add all files to queue
git add .

# Name the commit
message=`date`

# Add a new commit with today's date and time
echo "Creating a new commit"
git commit -m "$message"

#Push to main
echo "Pushing the files to repo"
git push origin