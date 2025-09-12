### Variable

Used to store and represent data in a memory
2 types
  1. System defined:- defined by system on the bash shell(env or printenv)
  2. User defined:- defined by the user in script

Syntax
Variable_name=data(int,string,char,array,null,bool)
No space around `=`

Properties
```
Overwritable
```

Variable naming convension
```
Contain letter,number,underscore.
Start with underscore(_),latter(a..z,A..Z).
Case-sensitive
No whitespace, special char
purposeful name
no reverse keyword(if,do,then,for,while,else,fi,done,set,case etc)
```
Allowed
```
mahin
MAHIN
Mahin
Mahin_RAZA
Mahin_
mahin123
_MAHIN
```

Not allowed
```
3MAHIM
MAHIN@RAZA
```

Export
```
export MAHIN=raza #avail to all sub shell sessions
echo "export MAHIN=raza" >> ~/.bashrc  #avail to all shell sessions
```

ECHO
```
echo $MAHIN
echo ${MAHIN}
echo $MAHIN_RAZA #wrong❌
echo ${MAHIN}_RAZA #right✔️
echo $0 #Displays the name of the current shell or the name of the script being executed.
echo $? #Exit code of last command
echo $$ #Give process id of current shell

```
