#!/bin/bash
#文件名：word_freq.sh
#用途：计算机中单词的词频

if [ $# -ne 1 ];then
  echo "Usage: $0 filename";
  exit -1
fi

filename=$1

grep -E -o "\b[[:alpha:]]+\b" $filename | \
awk '{ count[$0]++ } END { printf("%-14s%s\n", "Word", "Count"); for(ind in count) { printf("%-14s%s\n", ind, count[ind]); } }'

