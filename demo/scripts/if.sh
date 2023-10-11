#!/bin/bash

if [ $1 -gt $2 ]
then
	echo "$1 greater than $2."
elif [ $1 -eq $2 ]
then
	echo "$1 equal to $2."
else
	echo "$1 less than $2."
fi
