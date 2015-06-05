#!/bin/bash
# 文件名：filestat.sh

if [ $# -ne 1 ];
then
  echo $0 basepath;
  exit;
fi

path=$1

declare -A statArray

#语法格式
#while read line;do 
#  something
#done< filename

# <(file $path -type f -print) 等同于文件名
while read line;
do
  ftype=`file -b "$line"`
  let statArray["$ftype"]++;
done< <(find $path -type f -print)

#${!statArray[@]}用于反返回一个数组的索引列表
echo ===========File types and counts==========
for ftype in "${!statArray[@]}";
do
  echo $ftype : ${statArray["$ftype"]}
done
