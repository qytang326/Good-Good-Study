#!/bin/bash
#Program:
# Program shows the script name,parameters...	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

echo "The script name is  	 ==> ${0}"
echo "Total parameters number is ==>$#"
[ "$#" -lt 2 ] && echo "The number of parameters is less than 2. Stop here." && exit 0
echo "Your whole parameters is   ==>'$@'"
echo "The 1st parameters 	 ==>${1}"
echo "The 2nd parameters	 ==>${2}"
exit 0
