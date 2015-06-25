#!/bin/bash
#文件名：ping.sh
#  用途：检查局域网范围内主机活动情况
for ip in 192.168.214.{0..10};do
  ping $ip -c 1 &> /dev/null;
  if [ $? -eq 0 ];then
    echo -e "\e[1;32m$ip is alive\e[0m";
  else 
    echo $ip;
  fi
done
