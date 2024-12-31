#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: you must have sudo access tom execute the script"
    exit 1 
fi    

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "installing mysql..... FAILURE"
    exit 1
else 
    echo "installing mysql success..."

dnf install git -y

    if [ $? -ne 0 ]
then
    echo "installing git failure...."
    exit 1
else 
    echo "installing git .......SUCCESS"
fi


