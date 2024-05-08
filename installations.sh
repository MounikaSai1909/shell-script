#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run this script with root access."
exit 1 #manually exits if error comes
else
echo "you are super user."
fi
dnf install mysqll -y

if [ $? -ne 0 ]
then 
echo "Installation of mysql....Failure"
exit 1
fi
 
