#!/bin/bash
#用途：信号处理脚本
#运行脚本时，按下Ctrl+C发出一个SIGINT信号，就会触发handler()函数
function handler()
{
  echo Hey, received signal : SIGINT
}
#$$是一个特殊变量，它可以返回当前进程的进程ID
echo My process ID is $$

#handler是信号SIGINT的处理程序的名称
trap 'handler' SIGINT

while true;
do
  sleep 1
done




