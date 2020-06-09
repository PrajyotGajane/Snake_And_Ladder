echo "Welcome to snake and ladder game"
player1=0
echo "Position of player is $player1"
function dice(){
	diceValue=$(($((RANDOM % 6)) + 1))
	echo "Value of rolled dice :"$diceValue
}
dice
