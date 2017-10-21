#!/bin/bash
#Program:
#	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH
users=$(cut -d ":" -f1 /etc/passwd)
echo ${users}
for username in ${users}
do
	id ${username}
done
exit 0
