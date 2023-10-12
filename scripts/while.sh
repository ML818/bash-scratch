#!/bin/bash

read -p "Enter a number: " num

while [ $num -gt 1 ]
do
	num=$(( $num - 1 ))
	echo $num
done
