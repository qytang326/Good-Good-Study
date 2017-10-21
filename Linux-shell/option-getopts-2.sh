#!/bin/bash
#set --$(getopt -q abcd: "$@")
echo
while getopts :abcd: opt
do
	case $opt in
		a) echo "Found -a option";;
		b) echo "Found -b option";;
		c) echo "Found -c option";;
		d) echo -d option,with value $OPTARG;;
		*) echo "$opt is not an option";;
	 esac
done
shift $[ $OPTIND - 1 ]
echo
count=1
for para in "$@"
do
	echo "Parameter $count : $para"
	count=$[ $count + 1 ]
done
