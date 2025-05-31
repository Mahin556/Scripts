#!/bin/bash
#$Revision:001$
#$Sat May 31 09:18:30 AM IST 2025$

#Variable
BASE_DIR=/home/demo
MAX_DEPTH=1
RUN=0
SIZE=+40M
DAYS=10

#Check if directory present or not
if [[ ! -d ${BASE_DIR} ]];then
	echo "Provided directory is not present: $BASE_DIR"
	exit 1
fi

#Create 'archive' folder if not already present
if [[ ! -d $BASE_DIR/archive ]];then
	mkdir -p $BASE_DIR/archive
fi

#Find all the files with size more than 20MB
for i in $(find $BASE_DIR -maxdepth 1 -type f -size $SIZE); do
	if [[ $RUN -eq 0 ]];then
		echo "[ $(date "+%b %d %r") ] archiving $i ==> $BASE_DIR/archive"
		gzip $i || exit 1
		mv $i.gz $BASE_DIR/archive || exit 1
	fi
done


