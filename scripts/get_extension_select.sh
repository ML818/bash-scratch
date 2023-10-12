#!/bin/bash

echo "Please follow these questions, answer them honestly, thanks all."

read -p "What is your first name? " fname
echo

read -p "What is your surname? " sname
echo

# add select commands
PS3="What is the type of phone with the options?"
select types in headset handheld;
do
	echo "You selected $types."
	break
done
echo
PS3="What is your department?"
select department in finance sales "customer service" engineering;
do
	echo "Your department is $department."
	break
done

read -p "What is your extension number? (4 digits)" -N 4 exnum
echo 

read -s -p "What access code would you like to use when dialing in? (4 digits)" -N 4 accode
echo 

echo "$fname, $sname, $exnum, $accode, $types, $department" >> output.csv

