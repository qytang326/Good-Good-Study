#!/bin/bash
for ((a=1;a<10;a++))
do
	for ((b=1;b<10;b++))
	do
		echo $a*$b=$[ $a*$b ]
	done
done
