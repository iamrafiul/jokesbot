#!/bin/bash

DIALOG=gdialog || DIALOG=dialog

while true
do
	OPTION=$(whiptail --title "PERCCOM Student List" --menu "Choose your option" 15 60 4 \
	"1" "Belgium" \
	"2" "France" \
	"3" "UK" \
	"4" "USA"  3>&1 1>&2 2>&3) 
	 	
	if [ $OPTION -eq 1 ]; then
	{
    		bash jokes.sh Belgium
	}
	elif [ $OPTION -eq 2 ]; then
	{
		bash jokes.sh France
	}
	elif [ $OPTION -eq 3 ]; then
	{
		bash jokes.sh UK
	}
	elif [ $OPTION -eq 4 ]; then
	{
		bash jokes.sh USA
	}
	else
		exit
	fi
done