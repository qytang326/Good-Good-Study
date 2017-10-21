#!/bin/bash
#Program:
#	This program shows "Hello World!" in your screen. Use case...esac
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH
case ${1} in
	"hello")
		echo "Hello"
		;;
	"")
		echo "MUST input parameters."
		;;
	*)
		echo "Usage ${0} {hello}"
		;;
esac
exit 0
