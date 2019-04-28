#!/bin/bash

#内存总量
total=`free -m |grep Mem |awk '{print $2}'`
#内存使用量
used=`free -m |grep Mem |awk '{print $3}'`
#计算使用百分比
rate=`echo "($used * 100)/$total"|bc`
#清理缓存文件
caches_file=/proc/sys/vm/drop_caches

date "+%F %H:%S"

#判断内存使用量大于70%时清理缓存
if [ $rate -gt 71 ]
then
	echo "当前系统内存占用: $rate%, 开始清理!"
	sync
	sleep 2
        #echo 1 是释放页缓存, 2 是释放dentries(目录)和inodes缓存,3是释放1和2的所有缓存
	echo "3" >  $caches_file
	echo "清理完成！"
else
        echo "当前系统内存占用: $rate%, 不用清理!"
fi
