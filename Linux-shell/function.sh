#!/bin/bash
function func1 {
	echo "This is an example"
}
func2() { 
	echo "Another"
}
count=1
while [ $count -le 5 ]
do
	func1
	count=$[ $count + 1 ]
done
echo "The end of the loop"
func1
echo "The end of the script"

