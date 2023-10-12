#!/bin/bash

while getopts "a:b:c:" opt
do
	case $opt in
		a) a=$OPTARG; echo $a;;
		b) echo "b : $OPTARG ";;
		c) echo "c : $OPTARG ";;
		?);;
	esac
done
