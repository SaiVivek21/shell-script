#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
  
SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=${3:-14}

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

USAGE(){
   
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DESTINATION_DIR> <DAYS(OPTIONAL)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
    USAGE
    
fi

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo -e "$SOURCE_DIRECTORY Does not exist ......Please Check"
    exit 1
fi
 if [ ! -d $DESTINATION_DIRECTORY ]
 then
    echo "$DESTINATION_DIRECTORY Does not exist .... Please Check"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FIND=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +DAYS) 

echo "files are : $FILES"