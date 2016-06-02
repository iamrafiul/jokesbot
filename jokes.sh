#!/bin/bash

# This file is public domain in the USA and all free countries.
# Elsewhere, consider it to be WTFPLv2. (wtfpl.net/txt/copying)

input="./jokes.txt"

DIALOG=gdialog || DIALOG=dialog


while read line || [[ -n "$line" ]];
	do
		#parse data by delemeter ':'

		country=$(echo $line | cut -f1 -d':'| xargs)
	    jokes=$(echo $line | cut -f2 -d':' | xargs)	
		
		#if country is found, print the jokes as ouput
		if [[ "$country" = "$1" ]]; then
			$DIALOG --title "Joke from $country" --infobox "$jokes" 5 10
			echo "$jokes";
			bash bashbot.sh broadcast "New jokes added : $jokes"
			exit
		fi
	done < "$input"

$DIALOG --title "Joke from $country" --infobox 'Sorry. There is no jokes from the country you mentioned.' 5 10 
exit