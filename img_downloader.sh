#!/bin/bash
#用途：图片下载工具
if [ $# -ne 3 ];then
  echo "Usage: $0 URL -d DIRECOTRY"
  exit -1
fi
:<<SSS
for i in {1..4}
do
  case $1 in
  -d) shift; directory=$1; shift;
   *) url=${url:-$1};shift;
esac
done
SSS
#mkdir -p $directory;
#baseurl=$(echo $url | grep -E )


until [ $# -eq 0 ];do
  echo "first arguments:$1, arguments nums:$#";
  shift
done

for i in {1..4};do
  case $1 in
    -d) shift;directory=$1;shift;
     *) url=${url:-$1};shift;
  esac
done

echo $directory;
echo $url;
