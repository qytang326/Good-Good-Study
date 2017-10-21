#!/bin/bash
#Program:
# Sum from 1 to 100 using loop	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

s=0
i=0
while [ "${i}" != "100" ]
do
	i=$((${i}+1))
	s=$((${s}+${i}))
done
echo "Result of summing from 1 to 100 is ==> $s"
exit 0
