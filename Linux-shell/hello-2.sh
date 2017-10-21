#!/bin/bash
#Program:
#	This program shows "Hello World!" in your screen.
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

if [ "${1}" == "hello" ]; then
	echo "Hello,how are you?"
elif [ "${1}" == '' ];then
	echo "You Must input parameters,ex>{${0}} someword}"
else
	echo "The only parameter is 'hello',ex>{${0} hello}"
fi
exit 0
