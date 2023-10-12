#!/bin/bash


# Update calculator.sh

# First argument is operator
# Accept max 9 arguments
# Only support single operator in once execution

if [ $1 == add ]
then
	echo "addition"
	echo $(( ${2:-0} + ${3:-0} + ${4:-0} + ${5:-0} + ${6:-0} + ${7:-0} + ${8:-0} + ${9:-0} + ${10:-0} ))
elif [ $1 == sub ]
then
	echo "subtraction"
	echo $(( ${2:-0} - ${3:-0} - ${4:-0} - ${5:-0} - ${6:-0} - ${7:-0} - ${8:-0} - ${9:-0} - ${10:-0} ))
elif [ $1 == mul ]
then
	echo "multiplication"
	echo $(( ${2:-0} * ${3:-1} * ${4:-1} * ${5:-1} * ${6:-1} * ${7:-1} * ${8:-1} * ${9:-1} * ${10:-1} ))
elif [ $1 == div ]
then
	echo "division"
	echo $(( ${2:-0} / ${3:-1} / ${4:-1} / ${5:-1} / ${6:-1} / ${7:-1} / ${8:-1} / ${9:-1} / ${10:-1} ))
fi
# echo $(( $2 $1 $3 $1 $4 $1 $5 $1 $6 $1 $7 $1 $8 $1 $9 $1 ${10} ))
