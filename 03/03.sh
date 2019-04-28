#!/bin/bash

for n in `ps -aux  |grep -v "TIME"|awk '{print $6}'`
do 
    sum=$[$sum+$n]
done

echo $[$sum/1024]M
