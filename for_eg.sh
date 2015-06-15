echo -e "\e[1;32mUsage: $0 filename \e[0m"
if [ $# -ne 1 ]; then
  echo "Error arguements."
  exit -1
fi

filename=$1

#迭代文件中的每一行
#while read line;
#do
#echo $line;
#done < $filename

#迭代一行中的每一个单词
#for word in $line;
#do
#echo $word;
#done

#迭代一个单词中的每一个字符
#注意：在每次迭代中，可以用一个特殊的方法${string:start_position:Number_of_characters}
#从字符串中提取一个字符
#for((i=0;i<${#word};i++))
#do
#echo ${word:i:1};
#done

:<<SSS
while read line;
do
  ftype=`file -b "$line"`
  echo $line $ftype
done< <(find . -type f -print)
SSS
