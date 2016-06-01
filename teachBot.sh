filename="jokes.txt"

echo "$1: \"$2\"" >> "$filename"
echo "New jokes Added"
bash bashbot.sh broadcast "New Language added : $1"