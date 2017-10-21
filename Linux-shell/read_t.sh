#!/bin/bash
if read -t 5 -p "Enter your name:" name
then
	echo "Hello $name"
else
	echo
	echo "Sorry,too slow"
fi
#read -p "Enter your age:" age
#echo "Hello $name"
#echo "That makes you over $[ $age * 365 ]"

