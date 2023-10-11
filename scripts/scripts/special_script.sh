#!/bin/bash

if [ $# -lt 2 ]
then
	echo "You did not have 2 parameters"
	echo "Usage: $0 <argument1> <argument2>"
fi

echo $@
echo "$@"
