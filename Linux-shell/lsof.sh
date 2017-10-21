#!/bin/bash
exec 3> testfile3
exec 6>testfile6
exec 7<testfile7

lsof -a -p $$ -d 0,1,2,3,6,7
