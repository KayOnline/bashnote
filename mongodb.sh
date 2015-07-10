#!/bin/bash
#启动MongoDB服务脚本

PIDFILE="/data/weblog/mongo/mongo.pid"
USAGE="\e[1;32mUsage: $0 start|stop\e[0m"
PID=0

if [ $# -ne 1 ];then
  echo -e $USAGE
  exit -1
fi


#如果进程PID文件存在，检查PIDFILE中记录的进程PID是否存在，存在则显示程序进程号，不存在则删除PIDFILE

if [ -e $PIDFILE ];then
   PID=`cat $PIDFILE`
   ps -ef | grep -v grep | grep $PID
   if [ $? -eq 0 ];then
     echo -e "\e[1;32mMongoDB Process: $PID\e[0m";
     exit -1
   fi
fi

case $1 in
  start)
    nohup mongod &> /data/weblog/mongo/mongod.log &
    echo $! > $PIDFILE
    ;;
  stop)
    pid=`cat $PIDFILE`
    kill $pid;
    rm $PIDFILE
    ;;
  *)
    echo -e $USAGE
    exit -1
esac

