#!/bin/bash
#sort 中-k4是指定第四列排序，如果不是默认的空格分隔符可以-t指定分隔符
ps -aux|sort -k4nr |head -n 10
