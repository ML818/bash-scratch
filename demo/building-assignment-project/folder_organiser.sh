#!/bin/bash


read -p "Which folder do you want to organise? (default in $HOME)" fname

cd $HOME/$fname

list=$(ls)

for name in ${list[@]}
do
	if [ -f $name ]
	then
		case $name in 
			*.jpg | *.jpeg | *.png) [[ -d images ]] || mkdir images; mv $name images ;;
			*.doc | *.docx | *.txt | *.pdf) [[ -d documents ]] || mkdir documents; mv $name documents ;;
			*.xls | *.xlsx | *.csv) [[ -d spreadsheets ]] || mkdir spreadsheets; mv $name spreadsheets ;;
			*.sh) [[ -d scripts ]] || mkdir scripts; mv $name scripts ;;
			*.zip | *.tar | *.tar.gz | *.tar.bz2) [[ -d archives ]] || mkdir archives; mv $name archives ;;
			*.ppt | *.pptx) [[ -d presentations ]] || mkdir presentations; mv $name presentations ;;
			*.mp3) [[ -d audio ]] || mkdir audio; mv $name audio ;;
			*.mp4) [[ -d video ]] || mkdir video; mv $name video ;;
			*) ;;
		esac
	fi
done





