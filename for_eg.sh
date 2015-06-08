#case
while read line;
do
  ftype=`file -b "$line"`
  echo $line $ftype
done< <(find . -type f -print)

