#!/bin/bash
#Quanyin
function db1 {
	read -p "Enter a value:" value
	echo "double the value"
	return $[ $value * 2 ]
}
db1
echo "The new value is $?"

function db2 {
	read -p "Enter a value:" value
	echo $[ $value * 2 ]
}

result=$(db2)
echo "The new value is $result"
