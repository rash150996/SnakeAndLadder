#!/bin/bash

echo "Welcome to snake and ladder"
position=0
pos=0
INITIAL_POSITION=0
END_POSITION=100


function playingOption()
{
	if [ $position -lt 94 ]
	then
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
	elif [ $position -ge 94 -a $position -le $END_POSITION ]
	then
		roll=$(( RANDOM % 6 + 1))
		echo "The die rolled to a $roll, move forward by $roll"
		if [ $(( $roll + $position )) -eq $END_POSITION ]
		then
			echo "You have won the game!"
			position=$END_POSITION
		else
			if [ $(( $roll + $position )) -gt $END_POSITION ]
			then
				position=$position
			else
				position=$(( $position+$roll ))
			fi
		fi
	fi
}

while (( $position <= $END_POSITION ))
do
	if [ $position -eq $END_POSITION ]
	then
		#position=100
		#echo "You reached the end!"
		break
	fi
   playingOption
	echo "You are at $position position"
done

