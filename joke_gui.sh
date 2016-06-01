#echo "Enter Country Name: "
#read sign

DIALOG=gdialog || DIALOG=dialog

while true
do
	data=$($DIALOG --title "Select acountry" --menu "Select a country:" 10 30 5 USA USA UK UK Belgium Belgium France France Dummy Dummy Exit Exit 3>&2 2>&1 1>&3) || end

	echo "Given Data is: $data"	

	if [[ "$data" = "Exit" ]]; then
		break
	fi

	bash jokes.sh "$data"
done