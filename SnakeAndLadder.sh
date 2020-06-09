echo "Welcome to snake and ladder game"
player1=0
echo "Position of player is $player1"
function dice(){
	diceValue=$(($((RANDOM % 6)) + 1))
	echo "Value of rolled dice :"$diceValue
	return $diceValue
}
dice
# 0 is No Play, 1 is Ladder, 2 is a Snake
No_play=0
Ladder=1
Snake=2
function board(){
	option=$((RANDOM % 3))
	if [[ $option -eq $No_play ]]
	then
		echo "No play"
	elif [[ $option -eq $Ladder ]]
	then
		echo "Reached a ladder"
	elif [[ $option -eq $Snake ]]
	then
		echo "Eaten by a snake"
	fi
}
board
