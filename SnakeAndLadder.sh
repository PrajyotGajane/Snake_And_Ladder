echo "Welcome to snake and ladder game"
player1=0
echo "Position of player is $player1"
function dice(){
	diceValue=$(($((RANDOM % 6)) + 1))
	echo "Value of rolled dice :"$diceValue
	return $diceValue
}
dice
diceCap=$?
# 0 is No Play, 1 is Ladder, 2 is a Snake
No_play=0
Ladder=1
Snake=2

function board(){
	option=$((RANDOM % 3))
	if [[ $option -eq $No_play ]]
	then
		echo
		echo "No play: No change in the position"
	elif [[ $option -eq $Ladder ]]
	then
		echo
		echo "Reached a ladder"
		player1=$(($player1 + $diceCap))
		echo "Player position is :"$player1
	elif [[ $option -eq $Snake ]]
	then
		echo
		echo "Eaten by a snake"
		player1=$(($player1 - $diceCap))
		echo "Player position is :"$player1
	fi
}
board
