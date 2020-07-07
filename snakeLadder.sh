#!/bin/bash

echo "Welcome to snake and ladder"
position=0
pos=0
INITIAL_POSITION=0
END_POSITION=100


function playingOption()
{
	roll=$(( RANDOM % 6 + 1))
	echo "The die rolled to a $roll"
	option=$(( RANDOM%3 ))
	if [ $option -eq 0 ]
	then
		echo "No play, position = $position"
		position=$position
	elif [ $option -eq 1 ]
	then
		echo "You got a ladder! move by $roll forward"
		position=$(( $position+$roll ))
	else
		echo "You got a snake! move by $roll backwards"
		position=$(( $position-$roll ))
		if [ $position -lt 0 ]
		then
			position=0
		fi
	fi
	newPos=$position
}

while (( $position < $END_POSITION ))
do
	playingOption
	if [ $position -ge 100 ]
	then
		position=100
		echo "You reached the end!"
		break
	fi
	echo "You are at $position position"
done

