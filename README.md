# jokesbot
A Telegram bot written in bash which gives you jokes from different country.

Depends on <a href="http://github.com/tmux/tmux">tmux</a>. Uses <a href="http://github.com/dominictarr/JSON.sh">JSON.sh</a>.

#Installation

Clone the repository:

git clone --recursive https://github.com/iamrafiul/jokesbot/

Create a file called token and paste your bot token in there. Then text your bot with the command /start.

#Usage

Create a file called token and place your bot token inside
run bash bashbot start inside the project directory
Send /start Message to your bot .( In this case @joke_bot)

1. To see jokes from different contries first run the app using the following command:

```bash
bash bashbot.sh start
```

Then go to telegram, find your bot(the bot token you had given in the token file) and type "/start". This command will initiate our app in telegram app and you will get the list of commands from the text it will provide. For example, the command for GUI application is "/joke"

2. To add a new joke from a country not listed, simply do 

```bash
bash teachBot.sh "<country>" "<jokes>"
```
For example, to add a joke from country ABC you have write

```bash
bash teachBot.sh ABC "The joke with double-quotation"
```

3. For the Terminal User Interface(TUI), do the following

```bash
bash joke_tui.sh
```

