#!/bin/bash
# Program:
# 	Try do tell you what you may eat.
# History:
# 2015/07/17	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

eat[1]="賣噹噹漢堡"
eat[2]="肯爺爺炸雞"
eat[3]="彩虹日式便當"
eat[4]="越油越好吃大雅"
eat[5]="想不出吃啥學餐"
eat[6]="太師父便當"
eat[7]="池上便當"
eat[8]="懷念火車便當"
eat[9]="一起吃泡麵"
eatnum=9

check=$(( ${RANDOM} * ${eatnum} / 32767 + 1 ))
echo "your may eat ${eat[${check}]}"
