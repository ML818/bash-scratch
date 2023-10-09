#!/bin/bash

while getopts "v:f:" param
do
	case "$param" in
		f) file="$OPTARG" ;;
		v) set-x ;;
		*) echo "Unknown option" ;;
	esac
done

case "$file" in 
	*.zip) unzip "$file" ;;
	*.tar.gz) tar xzvf "$file" ;;
	*) echo "Unknown filetype" ;;
esac

if [[ "$(uname)" == "Linux" ]]
then
	echo "Using Linux"
fi
