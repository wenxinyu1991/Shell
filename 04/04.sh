#!/bin/bash

#ping 193.112.38.222 获取packet丢失率 
n=`ping -c5 193.112.38.222 |grep "packet" |awk -F '%' '{print $1}' |awk '{print $NF}'`

#判断：如果丢失率为空，提示错误，并邮件发送
if [ -z "$n" ]
then
	echo "脚本错误！"
	python mail.py $m  "检测机器存活脚本$0有问题,获取变量的值为空"
	exit 
else
	n1=`echo $n |sed 's/[0-9]//g'`
	if [ -n "$n1" ]
  	then
		echo "脚本错误！"
         	python mail.py $m  "检测机器存活脚本$0有问题,获取变量的值不是纯数字"
		exit
	fi
fi


#每隔60秒检测一次，如果丢失率大等于50就发邮件提示
while :
do
    if [ $n -ge 50  ]
    then
        python mail.py $m "机器宕机" "丢包率是$n%"	
    fi
    sleep 60 
done
