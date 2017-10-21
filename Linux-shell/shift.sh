#!/bin/bash
echo
count=1
while [ -n "$1" ]
do
	echo "Parameter count = $1"
	echo "Parameter2 count = $2"
	shift  2
done

