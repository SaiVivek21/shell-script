#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
    echo  ( "you need to get the root access to execute the script" )
    exit 1
fi    

dnf install git -y

if [ $? -ne 0]
then
    echo "installing git is failure"
    exit 1
else
    echo "installing git is success"
fi