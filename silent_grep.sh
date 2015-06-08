#!/bin/bash
#文件名:silent_grep.sh
#用途：测试文件是否包含特定的文本内容

if [ $# -ne 2 ];then
echo -e "\e[1;32m Usage: $0 match_text filename\e[0m"
exit
fi

match_text=$1
filename=$2

grep -q $match_text $filename

if [ $? -eq 0 ];then
  echo "the text exists in the file"
else
  echo "text does not exists in the file"
fi
