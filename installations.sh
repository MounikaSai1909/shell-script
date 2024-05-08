#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run this script with root access."
exit 1 #manually exits if error comes
else
echo "you are super user."
fi
dnf install mysql -y

if [ $? -ne 0 ]
then 
echo "Installation of mysql....Failure"
exit 1
else
echo "Installation of mysql....success"
fi

dnf istall git -y

if [ $? -ne 0 ]
then
echo "Installation of git.....Failure"
exit 1
else 
echo " Installation of git.....SUCCESS"
fi
echo "is script proceeding?"
 
