#!/bin/bash
#Program:
#	Using for ... loop to print 3 animals.	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

for animal in dog cat elephant
do
	echo "There are ${animal}s"
done

exit 0
