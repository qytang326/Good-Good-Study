#!/bin/bash
# Program:
#	Use function to repeat information.
# History:
# 2015/07/17	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

function printit(){
	echo "Your choice is ${1}"   # 這個 $1 必須要參考底下指令的下達
}

echo "This program will print your selection !"
case ${1} in
  "one")
	printit 1  # 請注意， printit 指令後面還有接參數！
	;;
  "two")
	printit 2
	;;
  "three")
	printit 3
	;;
  *)
	echo "Usage ${0} {one|two|three}"
	;;
esac
