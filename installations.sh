#!/bin/bash
USERID=$(id -u)

if[$USERID -ne 0]
then
echo " please run this script with root access "
else
echo " it is a superuser "
fi
dnf install mysql -y
