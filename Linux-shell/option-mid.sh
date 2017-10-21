#!/bin/bash
echo
while [ -n "$1" ]
do
	case $1 in
		-a) echo "Found -a option";;
		-b) echo "Found -b option";;
		-c) echo "Found -c option";;
		--) shift
			break;;
		 *) echo "$1 is not an option";;
	 esac
	 shift
done

count=1
for para in $@
do
	echo "Parameter #$count:$para"
	count=$[ $count + 1 ]
done
