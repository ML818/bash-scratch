#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-15

# Description:
# Log internet, RAM, Swap and Disk details in a log file performance.log

# Usage:
# ./performance_checker.sh



## Timestamp
echo "$(date +%Y-%m-%d_%H:%M:%s)" >> performance.log 

echo "-----------------------------------------------------------" >> performance.log

## Check Internet
ping -c 1 baidu.com &> /dev/null
if [ $? -eq 0 ]
then
	echo "Internet: Connected" >> performance.log
else
	echo "Internet: Disconnected" >> performance.log
fi

echo "" >> performance.log
## Check RAM
echo "RAM Usage : " >> performance.log
free -h | grep "Mem" >> performance.log

echo "" >> performance.log
## Check Swap
echo "Swap Usage: " >> performance.log
free -h | grep "Swap" >> performance.log

echo "" >> performance.log
## Check Disk
echo "Disk Usage : " >> performance.log
df -h >> performance.log

echo "-----------------------------------------------------------" >> performance.log
echo "" >> performance.log


