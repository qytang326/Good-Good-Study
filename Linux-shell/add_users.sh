#!/bin/bash

## Create user list
if [ -e user_list.txt ]
then
	rm user_list.txt
fi
for id in 1 2
do
	user=qytang_$id
	echo "qytang_$id,${user}_name" >>user_list.txt
done

#Add users
input="user_list.txt"
while IFS=',' read -r userid name
do	
	echo "adding $userid"
	echo "$userid $name"
	useradd -c "$name"  -m $userid
done <"$input"

