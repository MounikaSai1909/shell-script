#!/bin/bash

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
n="\e[0m"

VALIDATE(){
     if [ $1 -ne 0 ]
     then
          echo "$2....FAILURE"
          exit 1
     else
          echo "$2......SUCCESS"
          fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1
else   
     echo "you are super user."
fi
##

for i in $@
do
     echo "package to install: $i"
     dnf list installed $i &>>$LOGFILE
     if [ $? -eq 0 ]
     then 
          echo "$1 already installed.....skipping"
     else
          echo "$i not installed......Need to install"
     fi
done