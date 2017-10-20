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
echo ""
#print memory usage 
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo ""
#print cpu usage
top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
echo "" 

#citing from another source and adding some commends
echo "$(tput setaf 2)Use%  Avail  Used  Size  Filesystem $(tput setaf 7)"
df -H | grep -vE '^Filesystem' | awk '{print $5 " " $4 " " $3 " " $2 " " $1}' | while read output

do
    echo $output
    usep=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    partition=$(echo $output | awk '{print $2}')
    if [ $usep -ge 75 ]; then
       echo "Running out of space \"$partition ($usep%)\" on $(hostname)"
    fi
done

#source : https://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html

echo -e "$(tput setaf 2)Logged in users : $(tput setaf 7)\n"
finger -l
echo ""

cat "$HOME/.bash_history" > backup.txt
echo "Commands which users type can be looked in backup.txt file"

echo -e "$(tput setaf 2)\n Last 10 user commands : $(tput setaf 7)"
shopt -s histappend
history -a
history 10
