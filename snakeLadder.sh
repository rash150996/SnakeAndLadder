#!/bin/bash

echo "Welcome to snake and ladder"
position=0
pos=0
count=0

INITIAL_POSITION=0
END_POSITION=100


function playingOption()
{
	echo "Position = $position"
	if [ $position -lt 94 ]
	then
		roll=$(( RANDOM % 6 + 1))
		echo "The die rolled to a $roll"
		((count++))
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
		echo "The die rolled to a $roll"
		((count++))
		if [ $(( $roll + $position )) -eq $END_POSITION ]
		then
			echo "You have won the game!"
			position=$END_POSITION
		else
			if [ $(( $roll + $position )) -gt $END_POSITION ]
			then
				echo "No luck, roll again"
				position=$position
			else
				echo "You got a ladder! move forward by $roll"
				position=$(( $position+$roll ))
				echo "position = $position"
			fi
		fi
	fi
}

while (( $position <= $END_POSITION ))
do
	if [ $position -eq $END_POSITION ]
	then
		position=0
		count=0
		break
	fi
   playingOption
	playerOneCount=$count
done

while (( $position <= $END_POSITION ))
do
   if [ $position -eq $END_POSITION ]
   then
      position=0
      count=0
      break
   fi
   playingOption
   playerTwoCount=$count
done

echo "----------------------------------------------------------"
echo "It took Player 1 $playerOneCount die rolls to win the game"
echo "----------------------------------------------------------"
echo "It took Player 2 $playerTwoCount die rolls to win the game"

if [ $playerOneCount -lt $playerTwoCount ]
then
	printf "\nPlayer 1 won the game\n"
else
	printf "\nPlayer 2 won the game\n"
fi
