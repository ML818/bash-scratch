#!/bin/bash

read -p "Please Enter your scripts path:(default in $HOME) " path

cd $HOME/$path
if [ $? -eq 1 ]; then
	echo "Unknown path."
	exit 1
fi

echo $(pwd)

list=$(ls)

select item in ${list[@]}

