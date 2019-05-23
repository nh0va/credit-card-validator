#!/bin/bash

########## START FUNCTIONS ##########
function isEven() {
    return $(($1 % 2))
}

function isValid() {
    return $(($1 % 10))
}

########## END FUNCTIONS ##########

########## START SCRIPT ##########
declare cardArray[15]
sum=0

## Assign every number of the credit card into an array
for (( i=0; i<16; ++i)); do
	cardArray+=(${1:$i:1})
done

lastNumber=${cardArray[15]} # Variable with the last element of the array

unset 'cardArray[-1]' # Deletes the last element in the array

for (( i=0; i<15; ++i)); do
	## Multiplicate * 2 every value in an even position
	if isEven $i; then 
		cardArray[i]=$(( cardArray[i] * 2 )); 
	fi
	
	## If exists a two-digit number this loop will add those two digits
	if (( cardArray[i] > 9 )); then 
		cardArray[i]=$(( (cardArray[i]/10)+(cardArray[i]-10) ));
	fi
	
	## sum every element in the array
	let sum+=${cardArray[i]}
done

## adds the sum of the array with the last number of the credit card
finale=$(( $sum + $lastNumber ))

## Checks if the final number is a multiple of 10 with the function isValid
if isValid $finale; 
then 
	echo "$1 - Valid credit card"; 
else 
	echo "$1 - Invalid credit card"; 
fi

########## END SCRIPT ##########
