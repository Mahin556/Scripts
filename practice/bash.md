### This md file containes the basic concept of bash

```bash
echo $SHELL

cat /etc/shells

bash <script>

bash -n <script> #check systax of script

ctrl + z #to put vim in backgroud 
fg #to put vim in foreground
```

---

Can run bash commands in script

```bash
cat <<EOF > script
date
ls
cal
history 5
EOF
```
```bash
bash script
```

---

```bash
#!/bin/bash
date
sleep 20
echo "My name is mahin and today's date is $(date)"
```

---

```python
#!/usr/bin/python3
print("this is basic python code")
```

---

```bash
#!/bin/bash

#system variables

echo "This is Examples of all the system defined variables:-"
echo 
echo "BASH=${BASH}"
echo "HOME=${HOME}"
echo "USER=${USER}"
echo "BASH_VERSION=${BASH_VERSION}"
echo "CURRENT DIRECTORY=${PWD}"
echo "path to the location of the scripts=${PATH}"
echo "Script name is $0"
echo "your script exit status $?"
```

---

```bash
#!/bin/bash

echo "This is User Defined Variables Examples:-"
echo
FIRST_NAME="MAHIN"
LAST_NAME="RAZA"
echo "My Name is $FIRST_NAME $LAST_NAME".
exit 110
```

---

```bash
#!/bin/bash

BASH=/bin/bash
echo "This is line one \n This is line second"
echo "BASH=$BASH"
echo "BASH=`echo $BASH`"
echo "BASH=$(echo $BASH)"
echo 'BASH=$BASH'
echo "BASH=\$BASH"
echo -e "BASH=\$BASH"
```
```bash
This is line one \n This is line second
BASH=/bin/bash
BASH=/bin/bash
BASH=/bin/bash
BASH=$BASH
BASH=$BASH
BASH=$BASH
```

---

