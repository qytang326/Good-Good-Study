#!/bin/bash
var1=10.56
var2=2.3
var3=12
var4=22.2

var5=$(bc <<EOF
scale=4
a1=($var1*$var2)
b1=($var3*$var4)
a1+b1
EOF
)
echo Answer is $var5

exit 0
