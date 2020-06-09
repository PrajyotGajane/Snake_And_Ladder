echo "Welcome to snake and ladder game"
start=0
echo "Player One at $start position and Player Two at $start position"
function dice(){
 diceValue=$((RANDOM % 6 + 1))
}
win=100
diceReport=0
function game(){
        player=$1
        No_play=0
        Ladder=1
        Snake=2

        output=$((RANDOM % 3))
        if [[ $output -eq $No_play ]]
        then
                start=0
        elif [[ $output -eq $Ladder ]]
        then
                dice
                player=$(($player + $diceValue))
                if [[ $player -gt $win ]]
                then
                        player=$(($player - $diceValue))
                fi
                game $player
        elif [[ $output -eq $Snake ]]
        then
                dice
                player=$(($player - $diceValue))
                if [[ $player -lt $start ]]
                then
                        player=$start
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

if [[ $player1 -eq $win ]]
then
	echo "Player One is the winner"
else
	echo "Player Two is the winner"
fi
