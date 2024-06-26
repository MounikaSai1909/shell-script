#!/bin/bash

SOURCE_DIRECTORY=/tmp/app_logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then 
    echo -e " $G $SOURCE_DIRECTORY $N exits  "
else    
    echo -e "  make sure $R $SOURCE_DIRECTORY $N exits  "
    exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
do 
    echo "delete files: $line"
    rm -rf $line
done <<< $FILES

#