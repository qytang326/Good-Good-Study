#!/bin/bash
a=1
b=2
c=2
if test
then
	echo True
else
	echo False
fi
if test $c -eq $[ $a + $b ];then
	echo c=$c
else
	echo $[ $a + $b ] 
fi
if [ $c -eq $[ $a + $b ] ];then
	echo c=$c
else
	echo $[ $a + $b ] 

fi
if (( $a+$b >$c))
then
	echo gt
fi

