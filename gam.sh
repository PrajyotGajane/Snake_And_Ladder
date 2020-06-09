#!/bin/bash -x
function die(){
        rollDie=$((RANDOM % 6 + 1))
}

declare -a playerOne
declare -a playerTwo


function gameBoard(){
	local zero=0
	local ladder=3
	local snake=2
	local noPlay=1
	position=$1
 	check=$((RANDOM % 3 + 1))
        if [[ $check -eq $noPlay ]]
        then
                array[1]=1
        elif [[ $check -eq $snake ]]
        then
                die
                position=$(( $position - $rollDie ))
                if [[ $position -lt $zero ]]
                then
                        position=$zero
                fi
                #echo "Snack = player at position : $position"
        elif [[ $check -eq $ladder ]]
        then
                die
                position=$(( $position + $rollDie ))
                #echo "Ladder = player at position : $position"
        	echo "Play again"
		if [ $position -gt $winning ]
        	then
                	#echo "$position"
	                position=$(($position-$rollDie))
        	fi
        	#everyPosition[$numberOfDice]=$position
		gameBoard $position
		

	
	fi
	return $position
}

winning=100
positionOne=0
positionTwo=0

while [[ $positionOne -ne $winning && $positionTwo -ne $winning ]]
do
	let numberOfDice++
	gameBoard $positionOne
	positionOne=$?
	playerOne[$numberOfDice]=$positionOne

	gameBoard $positionTwo
	positionTwo=$?
        playerTwo[$numberOfDice]=$positionTwo

done
for (( i=1; i<=$numberOfDice; i++))
do
        echo "Position was :${playerOne[$i]} after dice roll :$i"
done

echo " player1 : $positionOne"
echo " player2 : $positionTwo"
echo "$numberOfDice"






































