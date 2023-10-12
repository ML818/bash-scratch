#!/bin/bash

for element in {1..10}
do
	echo $element
done


# array with for loop 
readarray -t files < <(ls)

for file in ${files[@]}
do
	echo $file
done
