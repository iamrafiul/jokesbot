# jokesbot
A Telegram bot written in bash which gives you jokes from different country.

Depends on <a href="http://github.com/tmux/tmux">tmux</a>. Uses <a href="http://github.com/dominictarr/JSON.sh">JSON.sh</a>.

Install bashbot

Clone the repository:

git clone --recursive https://github.com/iamrafiul/jokesbot/

Create a file called token and paste your bot token in there. Then text your bot with the command /start.

Usage

Create a file called token and place your bot token inside
run bash bashbot start inside the project directory
Send /start Message to your bot .( In this case @joke_bot)

To see jokes from different contries first run the app using the following command:

```bash
bash bashbot.sh start
```

Then go to telegram, find joke_bot and type "/start". This command will initiate our app in telegram app and you will get the list of commands from the text it will provide. For example, the command for GUI application is "/joke"


To add a new joke from a country not listed, simply do 

```bash
bash teachBot.sh "<country" "<jokes>"
```

Yet to be done:

- TUI application similar to GUI but runs in the command line(Work in progress.....)
- Localise the GUI application to Bengali language.
- Create an xinetd configuartion to enable running the bot as a daemon
