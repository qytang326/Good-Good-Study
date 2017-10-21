#!/bin/bash
for team in $(awk -F, '{print $2}' scores.txt|uniq)
do
    awk -v team=$team 'BEGIN{FS=",";total=0}
    {
        if ($2==team)
            {
                total += $3+$4+$5;
            }
    }
    END {
        avg = total/6;
        print "Total for",team,"is",total,",the average is ",avg
    }' scores.txt
done
