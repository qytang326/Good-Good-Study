#!/bin/bash
#Program:
#	This program shows the user's choice
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH
read -p "Please input (Y/N):" yn
[ "${yn}"=="Y" -o "${yn}"=="y" ] && echo "OK.continue" && exit 0
[ "${yn}"=="N" -o "${yn}"=="n" ] && echo "Oh,interrupt" && exit 0

#exit 0
