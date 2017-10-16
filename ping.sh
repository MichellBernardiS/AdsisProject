#!/bin/bash
host=$1
function pingcheck
{
		ping=`ping -c 1 $host | grep bytes | wc-`
		if ["ping" -gt 1];then
			echo "Host Alive"
		else
			echo"Host Down"
			exit
		fi
}