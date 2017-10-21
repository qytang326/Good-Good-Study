#!/bin/bash
function db1 {
	value=$[ $value * 2 ]
}
read -p "Enter a value:" value
db1
echo "The new value is: $value"
