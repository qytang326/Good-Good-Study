#!/bin/bash
exec 3<> testfile
read line <&3
echo "Read :$line"
echo "This is a test line" >&3

#count=1
#while read line
#do 
#	echo "Line $count : $line"
#	count=$[ $count + 1 ]
#done
#exec 0<&6
#read -p "Are you done now?" answer
#case $answer in
#	Y|y) echo "Goodbye";;
#	N|n) echo "Sorry,this is the end"
#esac

