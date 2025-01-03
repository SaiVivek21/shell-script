#!/bin/bash

USERID=$( id -u )

VALIDATE(){
    if [ $1 -ne 0 ]
    then
          echo "$2...........FAILURE"
          exit "$2...........SUCCESS"
     else
        echo  
    fi 
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: you must have sudo access tom execute the script"
    exit 1 
fi    

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "mysql is already installed......"
fi

dnf list installed git 

if [ $? -ne 0 ] 
then
    dnf install git -y
    VALIDATE $? "Installing GIT "
else 
    echo "GIT IS ALREADY INSTALLED......"
fi

