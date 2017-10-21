#!/bin/bash
count=1
cat pay.txt |while read line
do
	echo "Line $count:$line"
	count=$[ $count + 1 ]
done
echo "End of script"
