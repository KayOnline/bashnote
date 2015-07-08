#!/bin/bash
#用途:向指定的用户终端发送消息
#用法:./message.sh username < message.txt

if [ $# -ne 1 ];
then
  echo -e "\e[1;31mUsage: $0 USERNAME < MESSAGE\e[0m";
  exit -1;
fi

USER=$1

devices=`ls /dev/pts/* -l | awk '{ print $3,$10 }' | grep $USER | awk '{ print $2 }'`
for dev in $devices;
do
  cat /dev/stdin > $dev;
done
