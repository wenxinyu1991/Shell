#!/bin/bash
#ip 正则表达式
ip_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}"
find . -name "*.log" -type f -print | xargs cat | egrep -o $ip_regex | sort | uniq
