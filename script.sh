#!/bin/sh

echo -e "Details about your OS : \nYour kernel name : \c"
uname -s 
echo -e "Operating system : \c"
uname -o
echo -e "Kernel release at : \c"
uname -r 
echo -e "Kernel processor : \c"
uname -p 
echo -e "Hardware platform : \c"
uname -i
echo -e "Hardware machine : \c"
uname -m
echo "Your distribution OS information : "
cat /etc/*-release

