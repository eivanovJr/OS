#!/bin/bash

while true
do
	read line
	echo $line > pipe
	if [[ $line == "QUIT" ]]
	then
		exit 0
	fi

	if [[ $line != "+" && $line != "m" && ! $line =~ [0-9]+ ]]
	then
		echo "Incorrect Input"
		exit 1
	fi
done
