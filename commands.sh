#!/bin/bash
# Edit your commands in this file.

# This file is public domain in the USA and all free countries.
# Elsewhere, consider it to be WTFPLv2. (wtfpl.net/txt/copying)

if [ "$1" = "source" ];then
	# Place the token in the token file
	TOKEN=$(cat token)
	# Set INLINE to 1 in order to receive inline queries.
	# To enable this option in your bot, send the /setinline command to @BotFather.
	INLINE=1
	# Set to .* to allow sending files from all locations
	FILE_REGEX='/home/user/allowed/.*'
else
	if ! tmux ls | grep -v send | grep -q $copname; then
		[ ! -z ${URLS[*]} ] && {
		curl -s ${URLS[*]} -o $NAME
			send_file "${USER[ID]}" "$NAME" "$CAPTION"
			rm "$NAME"
		}
		[ ! -z ${LOCATION[*]} ] && send_location "${USER[ID]}" "${LOCATION[LATITUDE]}" "${LOCATION[LONGITUDE]}"

		# Inline
		if [ $INLINE == 1 ]; then
			# inline query data
			iUSER[FIRST_NAME]=$(echo "$res" | sed 's/^.*\(first_name.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iUSER[LAST_NAME]=$(echo "$res" | sed 's/^.*\(last_name.*\)/\1/g' | cut -d '"' -f3)
			iUSER[USERNAME]=$(echo "$res" | sed 's/^.*\(username.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iQUERY_ID=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -1)
			iQUERY_MSG=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -6 | head -1)

			# Inline examples
			if [[ $iQUERY_MSG == photo ]]; then
				answer_inline_query "$iQUERY_ID" "photo" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg"
			fi

			if [[ $iQUERY_MSG == sticker ]]; then
				answer_inline_query "$iQUERY_ID" "cached_sticker" "BQADBAAD_QEAAiSFLwABWSYyiuj-g4AC"
			fi

			if [[ $iQUERY_MSG == gif ]]; then
				answer_inline_query "$iQUERY_ID" "cached_gif" "BQADBAADIwYAAmwsDAABlIia56QGP0YC"
			fi
			if [[ $iQUERY_MSG == web ]]; then
				answer_inline_query "$iQUERY_ID" "article" "Telegram" "https://telegram.org/"
			fi
		fi
	fi
	case $MESSAGE in
		'/joke')
			#startproc "./question"
			#startproc "./jokes"
			startproc "./joke_gui.sh"
			;;
		'/info')
			send_message "${USER[ID]}" "This is bashbot, the Telegram bot written entirely in bash."
			;;
		'/start')
			send_message "${USER[ID]}" "This is a funny bot which can tell jokes from different countries and is written in bash.
			You can give the name of a county and the bot will show you a joke from that country.
			Currently available commands:
	• /start: Start bot and get this message.
	• /info: Get shorter info message about this bot.
	• /joke: Start interactive chat.
	• /cancel: Cancel any currently running interactive chats.
	Written by Drew (@topkecleon) and Daniil Gentili (@danogentili).
	http://github.com/topkecleon/telegram-bot-bash
	"
			;;
		'/cancel')
			if tmux ls | grep -q $copname; then killproc && send_message "${USER[ID]}" "Command canceled.";else send_message "${USER[ID]}" "No command is currently running.";fi
			;;
		*)
			if tmux ls | grep -v send | grep -q $copname;then inproc; else send_message "${USER[ID]}" "$MESSAGE" "safe";fi
			;;
	esac
fi
