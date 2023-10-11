#!/bin/bash

# Author: hisoka
# Created Date: 2023-10-08

# Description:
# curl all websites in file, and store infos to the specific file which name is correspond to website.

# Usage:
# ./project.sh


readarray -t urls < urls.txt

for url in ${urls[@]}
do
#	url_name=${url#*.}
#	url_name=${url_name%.*}
	url_name=$(echo $url | cut -d "." -f 2)
	curl --head $url > $url_name.txt
done
