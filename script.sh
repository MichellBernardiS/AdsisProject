#!/bin/sh

echo "Details about your OS : "
uname -s -r -p -i

echo "Your distribution OS information : "
cat /etc/*-release