# user input 

read 
echo $REPLY

read name
read age

echo -e "Your name is:- $name\nYour age is:- $age"

read -p "Enter your name: " name
read -p "Enter your age: " age
read -p "Enter your password: " -s password

echo -e "Your name is:- $name\nYour age is:- $age\nYour password is:- $password"

