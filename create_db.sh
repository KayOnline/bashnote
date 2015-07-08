#!/bin/bash
#创建Mysql数据库以及数据表

USER="root"
PASS="root"
HOST="127.0.0.1"
PORT=3306

mysql -h $HOST -P $PORT -u$USER -p$PASS <<EOF 2> /dev/null
CREATE DATABASE students;
EOF
[ $? -eq 0 ] && echo Created DB || echo DB already exist!

