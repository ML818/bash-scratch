#!/bin/bash

# Author: hisoka
# Date Created: 23-09-25
# Last Modified: 23-09-25

# Description: 
# Back up all file which in your home directory to a tar file in your home directory

# Usage: 
# backup_script

echo "Hello, ${USER^}"
echo "I will now back up your home directory, ${HOME}"

currentdir=$(pwd)
echo "You are running this script from ${currentdir}"
echo "Therefore, I will save the backup in ${currentdir}"

tar -cf ${currentdir}/my_backup_$(date +%Y%m%d_%H%M%S).tar ${HOME}/* 2>/dev/null

echo "Backup Completed Successfully."
