#!/bin/bash
#Program:
#	Repeat question until user input yes	
#History:
#2017/06/20 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

until [ "${yn}" == "yes" -o "${yn}" == "YES" ]
do
	read -p "Please input yes/YES to stop:" yn
done
echo "OK! You input the correct answer."

exit 0
