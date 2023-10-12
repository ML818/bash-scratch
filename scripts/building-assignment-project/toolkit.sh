#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-12

# Description:
# Choose a executable file to execution.

# Usage:
# ./toolkit.sh



read -p "Please Enter your scripts path:(default in $HOME) " path

cd $HOME/$path
if [ $? -eq 1 ]; then
	echo "Unknown path."
	exit 1
fi

echo $(pwd)

list=$(ls)

select item in ${list[@]}
do
	case $item in
		*.sh) echo "Running $item ..."; bash $item; exit 0 ;;
		*) echo "$item is not an executable file."
	esac
done
