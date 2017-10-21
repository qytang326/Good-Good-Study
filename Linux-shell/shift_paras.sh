#!/bin/bash
#Program:
#	Program shows the effect of shift function.	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH
echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>$@"
echo "First parameter is        ==>${1}"
shift
echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>$@"
echo "First parameter is        ==>${1}"
shift 3
echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>$@"
echo "First parameter is        ==>${1}"


exit 0
