```
#!/bin/bash
a=3
b=4

result=$(( a + b ))
echo $result
result=$(( a - b ))
echo $result
result=$(( a * b )) 
echo $result        
result=$(( a / b )) 
echo $result        
result=$(( a ** b ))
echo $result        
result=$(( a % b )) 
echo $result        

echo $((a++))       
echo $((++a))       
echo $((a--))       
echo $((--a))
```

```
#!/bin/bash

a=3
b=4

if [ $a -eq $b ];then
        echo "a and b is equal"
fi

if [ $a -ne $b ];then
        echo "a and b is not equla"
fi

if [ $a -gt $b ];then
        echo "a is greater"
else
        echo "b is greater"
fi

if [[ $a -ge $b ]]; then
        echo "a is greater or equal to b"  
fi

if [[ $a -lt $b ]];then
        echo "a is less then b"
fi

if [[ $a -le $b ]];then
        echo "a is less then or equal to b"
fi

if  [[ $a -gt $b ]];then echo "a is greater then b"; fi
if  [[ $a -gt $b ]];then echo "a is greater then b"; else echo "a is less then b";fi
if  [[ $a -gt $b ]];then echo "a is greater then b";exit 0 ; else echo "a is less then b";fi

(( $a == $b )) && echo "a and b is equal" || echo "a and b is not equal"
[[ $a -eq $b ]] && echo "a and b is equal" || echo "a and b is not equal"

(( $a != $b )) && echo "a and b is not equal" || echo "a and b is equal" 
[[ $a -ne $b ]] && echo "a and b is not equal" || echo "a and b is equal"

(( $a > $b )) && echo "a is greater then b" || echo "a is not greater  then b"  
[[ $a -gt $b ]] && echo "a is greater then b" || echo "a is not greater  then b"

(( $a < $b )) && echo "a is less then b" || echo "a is greater then b"  
[[ $a -lt $b ]] && echo "a is less then b" || echo "a is greater then b"

(( $a >= $b )) && echo "a is greater then and equal to b" || echo "b is greater then a" 
[[ $a -ge $b ]] && echo "a is greater then and equal to b" || echo "b is greater then a"

(( $a <= $b )) && echo "a is less then or equal to b" || echo "b is less then a"        
[[ $a -le $b ]] && echo "a is less then or equal to b" || echo "b is less then a"

true && exit 0
```

```
#!/bin/bash
s1="hello"
s2="world"

[ "$s1" = "hello" ] && echo "Equal"
[ "$s1" != "$s2" ] && echo "Not equal"

if [[ -z $s1 ]];then
        echo "1. Yes string is empty"
fi

if [[ -n $s2 ]]; then
        echo "2. Yes string is not empty"
fi

if [[ ! -z $s1 ]]
then
        echo "3. Yes string is not empty"
fi

if [[ ! -n $s2 ]]
then
        echo "4. Yes string is empty"
fi
```
```
#!/bin/bash

file=file1

[[ -e $file ]] && echo "Exist"
[[ -f $file ]] && echo "Regular file"
[[ -d $file ]] && echo "Directory"
[[ -b $file ]] && echo "Binary file"
[[ -c $file ]] && echo "character device"
[[ -S $file ]] && echo "Socket file"
[[ -p $file ]] && echo "PIPE"
[[ -L $file ]] && echo "Symlink"
[[ -r $file ]] && echo "Read"
[[ -w $file ]] && echo "write"
[[ -x $file ]] && echo "execute"
[[ -u $file ]] && echo "suid"
[[ -g $file ]] && echo "sgid"
[[ -k $file ]] & echo "sticky bit"
[[ -O $file ]] & echo "user owner"
[[ -G $file ]] & echo "group owner"

```

