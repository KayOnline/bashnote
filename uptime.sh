#!/bin/bash
#文件名：uptime.sh
#用途：系统运行时间监视器

IP_LIST="192.168.214.137"
USER="kay"

for IP in $IP_LIST;do
  utime=$(ssh $USER@$IP uptime | awk '{print $1}')
  echo $IP uptime: $utime
done
