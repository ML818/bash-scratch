#!/bin/bash

# Author: hisoka
# Created Date: 23 Sep 30th

# Description:
# Calculator which can set 9 argument max
# This script just support addition and subtraction

# ${parameter:-word}
# If parameter is unset or null, it will default set to 'word'


echo $(( ${2:-0} $1 ${3:-0} $1 ${4:-0} $1 ${5:-0} $1 ${6:-0} $1 ${7:-0} $1 ${8:-0} $1 ${9:-0} $1 ${10:-0}))


