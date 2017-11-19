#!/bin/sh
# please using source command like source percobaan instead of sh percobaan or ./percobaan
# we got idea from https://github.com/atarallo/TECMINT_MONITOR
info ()
{
        echo ""
        echo -e "$(tput setaf 2)Details about your OS : \n$(tput setaf 7)\c"
        echo -e "$(tput setaf 2)Your kernel name : $(tput setaf 7)\c"
                uname -s 
        echo -e "$(tput setaf 2)Kernel release at : $(tput setaf 7)\c"
                uname -r 
        echo -e "$(tput setaf 2)Operating system : $(tput setaf 7)\c"
                uname -o
        echo -e "$(tput setaf 2)Kernel processor : $(tput setaf 7)\c"
                uname -p 
        echo -e "$(tput setaf 2)Hardware platform : $(tput setaf 7)\c"
        uname -i
        echo ""
}

memory ()
{
        echo ""
        #print memory usage
        free -h total
        echo ""
        free -h | awk 'NR==2{printf "Memory Usage : %s/%s (%.2f%%)\n", $3,$2,$3*100/$2}'
        echo ""
        #print cpu usage
        top -bn1 | grep load | awk '{printf "CPU Load : %.2f\n", $(NF-2)}'
        echo ""
        echo ""
}
disk ()
{
        echo ""
        #citing from another source and adding some commands
        echo "$(tput setaf 2)Use% Avail Used Size Filesystem $(tput setaf 7)"
df -H | grep -vE '^Filesystem' | awk '{print $5 " "$4 " " $3 " " $2 " " $1}' | while read output;

do
        echo $output
        used=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
        partition=$(echo $output | awk '{print $2}')
if [ $used -ge 75 ]; then
                echo -e "Running out of space " $partition $used"% on $(hostname)"
        fi
done
        #source : https://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html
        echo ""
}
historyc ()
{
        echo ""
        cat "$HOME/.bash_history" > backup.txt
        echo -e "$(tput setaf 2)Commands which users type can be looked in backup.txt file"
        echo ""
        echo -e "Last 10 user commands : $(tput setaf 7)"
        shopt -s histappend
        history -a
        history 10
        echo ""
}

input="0"
while [ $input == "0" ] || [ $input != "5" ]
do
        echo "Script Tentang Monitoring Disk, Memory, System"
        echo -e "1. Monitoring System"
        echo -e "2. Monitoring Disk Usage"
        echo -e "3. Monitoring Memory Usage"
        echo -e "4. Monitoring Last Typed Command"
        echo -e "5. Exit"
        echo -e "Please choose one of them (1-5): \c"
        
read input
if [ $input -eq 1 ]; then
        info ;
elif [ $input -eq 2 ]; then
        disk ;
elif [ $input -eq 3 ]; then
        memory ;
elif [ $input -eq 4 ]; then
        historyc ;
elif [ $input -gt 5 ]; then
        echo ""
fi

done
