#!/bin/bash
SPACE_PATH=$(echo $PATH|sed 's/:/ /g')
count=0
for dir in $SPACE_PATH
do
        check=$(ls $dir)
        for item in $check
        do
                count=$[ $count + 1 ]
        done
        echo "$dir - $count"
        count=0
done

