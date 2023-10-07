#!/bin/bash

while getopts "a:b:c:" opt
do
	case $opt in
		a) echo "a : $OPTARG ";;
		b) echo "b : $OPTARG ";;
		c) echo "c : $OPTARG ";;
		?);;
	esac
done
