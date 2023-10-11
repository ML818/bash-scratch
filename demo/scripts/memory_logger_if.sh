#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-05

# Description:
# Gather current memory infos to $HOME/performance/memory.log

# Usage:
# ./memory_logger_if.sh


if [ -d $HOME/performance ]; then
	echo "$HOME/performance"
else
	mkdir $HOME/performance
fi

date +%Y-%m-%d_%H:%M:%s >> $HOME/performance/memory.log
free -h >> $HOME/performance/memory.log
echo "---------------------------------" >> $HOME/performance/memory.log
