echo "Welcome to snake and ladder game"
start=0
player1=0
echo "Position of player is $player1"
win=100
winner=100
while [[ $player1 -lt $win ]]
do
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
		previous=$player1
		player1=$(($player1 + $diceCap))
		if [[ $player1 -gt $winner ]]
		then
			player1=$previous
		fi
	elif [[ $option -eq $Snake ]]
	then
		echo
		echo "Eaten by a snake"
		player1=$(($player1 - $diceCap))
		if [[ $player1 -lt $start ]]
		then
			player1=$start
		fi
	fi
	echo "Player Position  $player1"
echo
echo
}
board
done
