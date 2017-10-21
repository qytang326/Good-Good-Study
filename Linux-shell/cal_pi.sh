#!/bin/bash
#Program:
#	User input a scale number to calculate pi number.
#History:
#2017/06/19 Quanyin qytang326@gmail.com v0.1
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH

echo -e "This program will calculate pi value.\n"
echo -e "You should input a float number to calculate pi value.\n"
read -p "The scale number (10-10000)?" checking
num=${checking:-"10"}
echo -e "Starting calculate pi value. Be patient."
time echo "scale=${num};4*a(1)"|bc -lq

exit 0
