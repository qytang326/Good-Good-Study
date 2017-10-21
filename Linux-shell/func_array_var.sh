#!/bin/bash
function testit {
	echo "The parameters are $@"
	thisarray=$1
	echo "The recived array is ${thisarray[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is :${myarray[*]}"
testit $myarray

function testit2 {
	local newarray
#	newarray=(;'echo "$@"')
	newarray=`echo "$@"`
	echo "The new array value is : ${newarray[*]}"
}

myarray2=(1 2 3 4 5)
echo "The original array is :${myarray2[*]}"
testit2 ${myarray2[*]}
