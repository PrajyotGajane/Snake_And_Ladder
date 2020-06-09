function dice(){
 diceValue=$((RANDOM % 6 + 1))
}
win=100
zero=0
function game(){
	player=$1
	noPlay=0
	ladder=1
	snake=2
	
	output=$((RANDOM % 3))
	if [[ $output -eq $noPlay ]]
	then
		zero=0
	elif [[ $output -eq $ladder ]]
	then
		dice
		player=$(($player + $diceValue))
		if [[ $player -gt $win ]]
		then
			player=$(($player - $diceValue))
		fi
		game $player
	elif [[ $output -eq $snake ]]
	then
		dice
		player=$(($player - $diceValue))
		if [[ $player -lt $zero ]]
		then
			player=$zero
		fi
	fi
return $player
}
player1=0
player2=0
while [[ $player1 -ne $win && $player2 -ne $win ]]
do
	game $player1
	player1=$?
	
	game $player2
	player2=$?
done
echo "Player one is at $player1 and Player two is at $player2"
