#!/bin/bash
#监视远程系统的磁盘使用情况

logfile="diskusage.log"
if [[ -n $1 ]];then
  logfile=$1
fi

echo $logfile;

#if [ ! -e $logfile ];then
  printf "%-18s %-18s %-9s %-8s %-6s %-6s %-6s %s\n" "Date" "IP address" "Device" "Capacity" "Used" "Free" "Percent" "Status"
#fi

# 提供远程主机IP地址列表
ip="192.168.214.138"


df -H | grep -E '^/dev/' > /tmp/disklog.$$

while read line;
do
  cur_date=$(date '+%Y-%m-%d')
  printf "%-18s %-18s" $cur_date $ip
  echo $line | awk '{ printf("%-9s %-8s %-6s %-6s %-6s\n", $1, $2, $3, $4, $5) }'
  pusg=$(echo $line | grep -E -o "[0-9]{1,2}%")
  pusg=${pusg/\%/};
  #echo $pusg;
  if [ $pusg -gt 80 ];then
    printf "%s" SAFE
  else
    printf "%s" ALTER
  fi
done</tmp/disklog.$$
