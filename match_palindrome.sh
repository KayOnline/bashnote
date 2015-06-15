#!/bin/bash
#文件名：match_palindrome.sh
#用途：找出给定文件中的回字符

if [ $# -ne 1 ];then
  echo "Usage: $0 filename"
  exit -1
fi

filename=$1

while read line;do
  str=$(echo $line | rev);
  if [ ${#line} -gt 1 -a $str == $line ]; then
    echo $line;
  fi
done<$filename




