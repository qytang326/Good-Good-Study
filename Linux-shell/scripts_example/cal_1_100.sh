#!/bin/bash
# Program:
#	Use loop to calculate "1+2+3+...+100" result.
# History:
# 2015/07/17	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

s=0  # 這是加總的數值變數
i=0  # 這是累計的數值，亦即是 1, 2, 3....
while [ "${i}" != "100" ]
do
	i=$(($i+1))   # 每次 i 都會增加 1 
	s=$(($s+$i))  # 每次都會加總一次！
done
echo "The result of '1+2+3+...+100' is ==> $s"
