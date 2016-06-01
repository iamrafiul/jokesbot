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
To add a new joke from a country not listes, simply do 

```bash
bash teachBot.sh "<country" "<jokes>"
```

Yet to be done:

- GUI application to interact with teachBot and make it easier to add languages
- Localise the GUI application to arabic language.
- Create an xinetd configuartion to enable running the bot as a daemon
