#!/bin/bash
#文件名：ping.sh
#  用途：检查局域网范围内主机活动情况

echo -e "\e[1;42mFind alive IP:\e[0m"

#将循环体放入()使其中的命令作为子shell来执行
#&可以使之脱离当前线程在后台继续运行
#wait等所有子进程结束之后再终止脚本
for ip in 192.168.214.{0..255};do
  (
  ping $ip -c 1 &> /dev/null;
  if [ $? -eq 0 ];then
    echo -e "\e[1;32m$ip\e[0m";
  fi
  )&
done
wait
