#!/bin/bash
#Program:
#	Try do tell you what to eat.	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

eat[1]="MacDonald"
ect[2]="KFC"
eat[3]='ele'
eat[4]='meituan'
eat[5]='Paomian'

eatnum=5
check=$(( ${RANDOM}*${eatnum} / 32767 + 1 ))
echo "you may eat ${eat[${check}]}"

exit 0
