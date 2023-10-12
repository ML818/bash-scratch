#!/bin/bash

PS3="What is the day of the week?"

select day in Mon Tue Wed Thu Fri Sat Sun;
do
	echo "The day of the week is $day"
	break
done
