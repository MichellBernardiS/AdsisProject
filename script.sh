#!/bin/sh

# please using source command like source script.sh instead of sh or ./
# we got idea from https://github.com/atarallo/TECMINT_MONITOR

echo -e "$(tput setaf 2)Details about your OS : \nYour kernel name : $(tput setaf 7)\c"
uname -s 
echo -e "$(tput setaf 2)Operating system : $(tput setaf 7)\c"
uname -o
echo -e "$(tput setaf 2)Kernel release at : $(tput setaf 7)\c"
uname -r 
echo -e "$(tput setaf 2)Kernel processor : $(tput setaf 7)\c"
uname -p 
echo -e "$(tput setaf 2)Hardware platform : $(tput setaf 7)\c"
uname -i

echo -e "$(tput setaf 2)Logged in users : $(tput setaf 7)\n"
finger -l
echo ""

cat "$HOME/.bash_history" > backup.txt
echo "Commands which users type can be looked in backup.txt file"

echo -e "$(tput setaf 2)\n Last 10 user commands : $(tput setaf 7)"
shopt -s histappend
history -a
history 10
