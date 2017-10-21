#!/bin/bash
read -n1 -p "Do you want continue[Y/N]:" answer
case $answer in
	Y|y) echo
	     echo "fine,continue...";;
	N|n) echo
		echo OK,goodbye
		exit;;
esac
echo "This is the end of the script."
#read -p "Enter your age:" age
#echo "Hello $name"
#echo "That makes you over $[ $age * 365 ]"

