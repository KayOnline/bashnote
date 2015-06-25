#!/bin/bash
#查找网站中的无效链接

if [ $# -ne 1 ];then
  echo -e "\e[1;32mUsage: $0 URL\e[0m"
  exit -1;
fi

echo Broken links:
mkdir /tmp/$$.lynx
cd /tmp/$$.lynx

url=$1;

lynx -traversal $url > /dev/null 
count=0;
sort -u reject.dat > links.txt


#while read link;
#do
#  output=`curl -I $link -s | grep "HTTP/."OK"`;
#  if [[ -z $output ]];
#  then
#    echo $link;
#    let count++
#  fi
#done < link.txt

#[ $count -eq 0 ] && echo No broken links found.

