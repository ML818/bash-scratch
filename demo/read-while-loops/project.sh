#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-08

# Description:
# Create folders by content of text file

# Usage:
# ./project.sh <file_path>

while read line 
do
	echo "creating $line folder"
	mkdir $(pwd)/"$line"
	echo "done."
done < $1
