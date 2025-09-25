function factorial(){
	factorial=1
	i=1
	num=$1
	while [ $i -le $num ]; do
		factorial=$((factorial * i))
		((i++))
	done
	echo $factorial
}
read -p "Give number: " num
result=$(factorial $num)
echo "Factorial of $num is: $result"
