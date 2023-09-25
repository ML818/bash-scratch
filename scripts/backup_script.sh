#!/bin/bash

# Author: hisoka
# Date Created: 23-09-25
# Last Modified: 23-09-25

# Description: 
# Back up all file which in your home directory to a tar file in your home directory

# Usage: 
# backup_script


tar -cvf ~/bash-scratch/my_backup_"$(date +%Y%m%d_%H%M%S)".tar ~/* 2>/dev/null
