#!/bin/bash
d=`date +%F`

logdir=/data/log/shell/disk

#判断log文件是否存在
if [ ! -d $d ]
then 
 mkdir -p $logdir
fi

df -h > $logdir/$d.log
