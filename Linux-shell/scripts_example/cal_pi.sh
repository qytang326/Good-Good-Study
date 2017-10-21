#!/bin/bash
# Program:
#	User input a scale number to calculate pi number.
# History:
# 2015/07/16	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo -e "This program will calculate pi value. \n"
echo -e "You should input a float number to calculate pi value.\n"
read -p "The scale number (10~10000) ? " checking
num=${checking:-"10"}           # 開始判斷有否有輸入數值
echo -e "Starting calcuate pi value.  Be patient."
time echo "scale=${num}; 4*a(1)" | bc -lq
