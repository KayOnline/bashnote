#!/bin/bash
#用途：监视时间范围内的CPU占用情况

#将SECS更改成需要进行监视的总秒数
SECS=3600

#UNIT_TIME是取样的时间间隔，单位是秒
UNIT_TIME=60

STEPS=$(($SECS / $UNIT_TIME))

echo -e "\e[1;32mWatching CPU usage...\e[0m"

#for((i=0;i<STEPS;i++))
#do
  ps -eo comm,pcpu | tail -n +2 >> /tmp/cpu_usage.$$
 # sleep $UNIT_TIME
#done

echo
echo CPU eaters:

cat /tmp/cpu_usage.$$ | \
awk '
{ process[$1]+=$2; }
END{
  for(i in process)
  {
    printf("%-20s %s\n", i, process[i]);
  }
}' | sort -nrk 2 | head

#删除临时日志文件
rm /tmp/cpu_usage.$$
