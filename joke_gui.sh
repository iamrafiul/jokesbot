#echo "Enter Country Name: "
#read sign

DIALOG=gdialog || DIALOG=dialog

data=$($DIALOG --inputbox "`$GETTEXT \"Enter a Country Name:\"`" 8 35 3>&2 2>&1 1>&3) || end
#echo $GETTEXT;

#choice=$($DIALOG --title "Selection a country" --menu "Command" 15 50 8 \
#	  "$(cat "USA")" "USA" \
#	  "$(cat "UK")" "UK" \
#	  "$(cat "Belgium")" "Belgium" \
#	    3>&2 2>&1 1>&3)|| end

#$data=#GETTEXT;

echo "Given Data is: $data"

bash jokes.sh "$data"

exit