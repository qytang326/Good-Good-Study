#!/bin/bash
echo
while [ -n "$1" ]
do
	case $1 in
		-a) echo "Found -a option";;
		-b) echo "Found -b option";;
		-c) echo "Found -c option";;
		 *) echo "$1 is not an option";;
	 esac
	 shift
 done
