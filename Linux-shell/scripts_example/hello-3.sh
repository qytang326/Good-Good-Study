#!/bin/bash
# Program:
# 	Show "Hello" from $1.... by using case .... esac
# History:
# 2015/07/16	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

case ${1} in
  "hello")
	echo "Hello, how are you ?"
	;;
  "")
	echo "You MUST input parameters, ex> {${0} someword}"
	;;
  *)   # 其實就相當於萬用字元，0~無窮多個任意字元之意！
	echo "Usage ${0} {hello}"
	;;
esac
