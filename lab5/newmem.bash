#!/bin/bash
declare -a buff
step=0
while true
do
	let step=step+1
	for((count=0;count<5;count++))
	do
		buff+=("$count")
		if [[ ${#buff[@]} -eq $1 ]]
		then
			echo ${#buff[@]}
			exit 0
		fi
	done
done
