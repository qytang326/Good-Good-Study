#!/bin/bash
#Program:
#	User inputs his first name and last name. Program shows his full name.
#History:
#2015/07/16 Quanyin First Release
PATH=/bin:/sbin://usr/bin:/ust/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input your first name:" firstname
read -p "Please input your last name:" lastname
echo -e "\nYour full name is :${firstname} ${lastname}"


