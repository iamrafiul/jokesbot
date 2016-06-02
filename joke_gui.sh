#echo "Enter Country Name: "
#read sign

JOKEBOT=jokebot
HOST=localhost
PORT=1234


if [ -r ~/.jokes.conf ]
then
	. ~/.jokes.conf
elif [ -r /etc/jokes.conf ]
then
	. /etc/jokes.conf
fi

help () {
        echo "Usage: $0 [ host [port] | --help ]"
}

end () {
	exit
}

if [ $# -eq 1 ]
then
        if [ $1 -eq '--help' ]
        then
                help
                exit -1
        else
                HOST=$1
        fi
elif [ $# -eq 2 ]
then
        PORT=$2
fi

if [ $# -ge 1 -o `basename $0` = 'joke_gui' ]
then
	if [ $HOST -a $PORT ]
	then
	        JOKEBOT="nc $HOST $PORT"
	else
		echo "You must set HOST and PORT"
		exit -2
	fi
fi


DIALOG=gdialog || DIALOG=dialog

while true
do
	data=$($DIALOG --title "Select a country" --menu "Select a country:" 10 30 5 USA USA UK UK Belgium Belgium France France Dummy Dummy Exit Exit 3>&2 2>&1 1>&3) || end

	echo "Given Data is: $data"	

	if [[ "$data" = "Exit" ]]; then
		break
	fi

	bash jokes.sh "$data"
done