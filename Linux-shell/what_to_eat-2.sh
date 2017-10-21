#!/bin/bash
#Program:
#	Try do tell you what to eat.	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

eat[1]="MacDonald"
ect[2]="KFC"
eat[3]="ele"
eat[4]="meituan"
eat[5]="Paomian"
eatnum=5

eated=0
while [ "${eated}" -lt 3 ];do
	check=$(( ${RANDOM}*${eatnum} / 32767 + 1 ))
	mycheck=0
	if [ "${eated}" -ge 1 ];then
		for i in $(seq 1 ${eated} )
		do	
			  if [ ${eatedcon[$i]} == $check ]; then 
				  mycheck=1
			  fi
		  done
	  fi
	   if [ ${mycheck} == 0 ]; then 
		   echo "your may eat ${eat[${check}]}" 
		   eated=$(( ${eated} + 1 )) 
		   eatedcon[${eated}]=${check} 
	   fi
   done

exit 0
