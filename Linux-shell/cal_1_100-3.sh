#!/bin/bash
#Program:
# Sum from 1 to 100 using loop	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

s=0
i=0
read -p "Please input a number. I will count for 1+2+...+your_input:" nu
for (( i=1;i<=${nu};i=i+1 ))
do
	s=$((${s}+${i}))
done
echo "Result of summing from 1 to ${nu} is ==> $s"
exit 0
