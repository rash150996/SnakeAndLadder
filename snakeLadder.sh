#!/bin/bash

echo "Welcome to snake and ladder"
position=0


function playingOption()
{
roll=`expr $(( RANDOM % 7)) | grep -v 0`
echo "The die rolled to a $roll"
option=$(( RANDOM%3 ))
if [ $option -eq 0 ]
then
	echo "No play, position = $position"
	position=$position
elif [ $option -eq 1 ]
then
	echo "You got a ladder! move by $roll forward"
	position=$(( $position + $roll ))
else
	echo "You got a snake! move by $roll backwards"
	position=$(( $position - $roll ))
fi
}

playingOption
