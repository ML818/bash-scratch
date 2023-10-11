#!/bin/bash


# Update positional_script.sh

# Author: hisoka
# Created Date: 23 Sep 30th

# Description: 
# By means of special parameters to achieve calculator function.
# These four statement are exactly the same as each other for calculator.

# Usage:
# ./update_special_script.sh 1+2-3*4/5

echo $(( "$*" ))
echo $(( $* ))

echo $(( "$@" ))
echo $(( $@ ))
