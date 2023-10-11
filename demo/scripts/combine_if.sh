#!/bin/bash

a=5
b=6
c=7

if [ $a -lt $b ] && [ $a -lt $c ]; then
	echo "$a is least variable"
fi
