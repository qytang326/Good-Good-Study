#!/bin/bash
#Program:
#   User input dir name, I find the permissions of the files.	
#History:
#2017/06/18 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

read -p "Please input a directory:" dir
if [ "${dir}" == "" -o ! -d "${dir}" ];then
	echo "The ${dir} is Not exist in your system."
	exit 1
fi

filelist=$(ls $dir)
for filename in $filelist
do
	perm=""
	test -r "${dir}/${filename}" &&  perm="${perm} r"
	test -w "${dir}/${filename}" &&  perm="${perm} w"
	test -x "${dir}/${filename}" &&  perm="${perm} x"
	echo "The file ${dir}/${filename}'s permission is ${perm}"
done

exit 0
