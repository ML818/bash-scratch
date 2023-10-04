#!/bin/bash

echo "Please follow these questions, answer them honestly, thanks all."

read -p "What is your first name? " fname
echo

read -p "What is your surname? " sname
echo

read -p "What is your extension number? (4 digits)" -N 4 exnum
echo 

read -s -p "What access code would you like to use when dialing in? (4 digits)" -N 4 accode
echo 

echo "$fname,$sname,$exnum,$accode" >> output.csv

