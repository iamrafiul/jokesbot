#!/bin/bash

# This file is public domain in the USA and all free countries.
# Elsewhere, consider it to be WTFPLv2. (wtfpl.net/txt/copying)


#read input from user
#echo "Which country you want to hear a joke from?"
#read answer

#take the text file as input and loop through it's every line"

echo "$1";

input="./jokes.txt"

DIALOG=gdialog || DIALOG=dialog

while read line || [[ -n "$line" ]];
	do
		#parse data by delemeter ':'

		country=$(echo $line | cut -f1 -d':'| xargs)
	    jokes=$(echo $line | cut -f2 -d':' | xargs)	
		
		#if country is found, print the jokes as ouput
		if [[ "$country" = "$1" ]]; then
			#MSG="`$GETTEXT \"Result:\"` $jokes \\n\\n`$GETTEXT \"Continue?\"`"
			#$DIALOG --yesno "$MSG" 7 20 || end
			MSG=$("`$GETTEXT \'Result:\'` $jokes \\n\\n`$GETTEXT \'Continue?\'`" 8 35 3>&2 2>&1 1>&3) || end
			$DIALOG --yesno "$MSG" 7 10 || end
			#echo "$jokes";
			exit
		fi
	done < "$input"

echo 'Sorry! There is no jokes from the country you mentioned.'