#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: you must have sudo access tom execute the script"
    exit 1 
fi    

dnf install mysqll -y

dnf install git -y