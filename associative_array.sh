# Associative Array 关联数组

# 必须用单独的声明语句将一个变量声明为关联数组
declare -A assArray

# 赋值方式1
assArray=(['address']='Gz' ['age']=26)

# 赋值方式2
assArray['username']="Kay"
assArray['password']="123"

# 遍历关联数组键
for key in ${!assArray[@]};do
  echo $key : ${assArray[$key]}
done

# 遍历关联数组值
for value in ${assArray[@]};do
  echo $value
done

#列出所有键
echo ${!assArray[*]}
#列出所有值
echo ${assArray[*]}

