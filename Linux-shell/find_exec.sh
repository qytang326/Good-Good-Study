#!/bin/bash
IFS_OLD=$IFS
IFS=:
if [ -f EXE ]
then
	rm EXE
fi
for folder in $PATH
do
	if [ -e $folder ];then
		echo $folder >>EXE
		for file in ${folder}/*
		do
			if [ -x $file ]
			then
				echo "    $file" >>EXE
			fi
		done
	fi
done
IFS=${IFS_OLD}
