#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)

echo "script executed at :$TIMESTAMP"
 
SUM=$(($NUMBER1+$NUMBER2))

echo "SUM of $1NUMBER1 and $2NUMBER2 is : $SUM"