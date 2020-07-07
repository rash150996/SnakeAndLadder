#!/bin/bash

echo "Welcome to snake and ladder"
position=0
roll=`expr $(( RANDOM % 7)) | grep -v 0`

echo "The die rolled to a $roll"
