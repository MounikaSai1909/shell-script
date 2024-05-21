#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...FAILURE"
        
    else
        echo "$2....SUCCESS"
    fi        

}
if [ $USERID -ne 0 ]
then
    echo "please run this script with root access."
    exit 1 #manually exits if error comes
else
    echo "you are super user."
fi

dnf install mysqll -y &>> $LOGFILE
VALIDATE $? "Installing MySQL"


dnf install gitt -y &>> $LOGFILE
VALIDATE $? "Installing git"