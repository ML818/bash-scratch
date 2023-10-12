#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-11

# Description:
# Filter older files and delete them.

# Usage:
# ./cruft_remover.sh


# Check the folder wether existed.
cd $HOME
read -p "Which folder do you want to check in your home dir? " fn
read -p "How many days files that unmodified you want to clean? " days

echo $(pwd)
if [ -d $fn ]
then
	echo $fn
else
#	echo $?
	echo "$fn is not existed."
	exit 1
fi

# Gather files in a text file which unmodified during $days.
## find $fn -mtime $days -type f > files_unmodified_$days.txt
## readarray -t files < files_unmodified_$days.txt
## improvement
readarray -t files < <(find $fn -mtime $days -type f -maxdepth 1)

echo "There are ${#files[@]} files that unmodified totally."
read -p "Do you want to view the list?(Y/n)" flag
case $flag in
	Y) echo ${files[@]} ;;
	n) echo "Waiting for a moment please." ;;
	*) ;;
esac

echo

read -p "Do you want to delete them all or check them one by one?(all/check)" result
case $result in
	all) rm -irf $HOME/$fn;exit 0 ;;
	check) ;;
	*) echo "Unknown input";;
esac

echo

for file in ${files[@]}
do
	read -p "Do you want to delete $file?(Y/n)" input
	case $input in 
		Y) rm -i $file ;;
		n) echo "discard operation for $file." ;;
		*) ;;
	esac
done
