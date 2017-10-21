#!/bin/bash
#Program:
#	User input a filename,program will check the following:
#		1)exist? 2)file/directory? 3)file permissions
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

echo -e "Please input a filename, I will check the filename's type and permission.\n"
read -p "Please input a filename:" filename
test -z ${filename} && echo "You MUST input a filename." && exit 0
test ! -e ${filename} && echo "The ${filename} DO NOT exist" && exit 0

test -f ${filename} && filetype="regulare file"
test -d ${filename} && filetype="directory"
test -r ${filename} && perm="readable"
test -w ${filename} && perm="${perm} writable"
test -x ${filename} && perm="${perm} executable"

echo "${filename} ${filetype} ${perm}"

exit 0
