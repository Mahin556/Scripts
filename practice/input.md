```bash
#!/bin/bash

echo -e "\nEnter the path"
read path_demo

echo -e "\nyou path is:"`echo $path_demo`
ls $path_demo
```

---

```bash
#!/bin/bash

while read line
do
	echo $line
done < input.txt
```

---

```bash
#!/bin/bash
#Parameter
echo "Name:$1"
```

---

```bash
#!/bin/bash

echo "Enter a number:"
read num

if [ $num -gt 0 ] ; then
	echo "Number is Positive"
elif [ $num -lt 0 ]; then
	echo "Number is Negative"
else 
	echo "Number is zero"
fi
```
---
```bash
#!/bin/bash

i=1
echo "Enter a Max number:"
read num
echo -e "\nThe number to the $num"
while [ $i -le $num ]; do
	echo "$i"
	(( i += 1 ))
done
```

---

```bash
#!/bin/bash

i=1
echo "Enter a number:"
read num

echo -e "\nThe number to the $num"

while [ $i -le 10 ]; do
	echo "$num * $i = $(( $num*$i ))"
	(( i += 1 ))
done
```

---

```bash
#!/bin/bash

i=1
echo "Enter a number: "
read num

printf "The number you entered is: %d\n" $num

while [ $i -le $num ];do
  echo $i
  i=$((i+1))
done

for i in $(seq 1 $num);do
  echo $i
done

for ((i=1;i<=$num;i++));do
  echo $i
done
```

---

```bash

```