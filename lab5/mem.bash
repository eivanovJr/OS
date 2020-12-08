#!/bin/bash
>report.log
declare -a buff
step=0
while true
do
	let step=step+1
	for((count=0;count<5;count++))
	do
		buff+=("$count")
	done
	if [[ $(($step % 100000)) -eq 0 ]]
	then
		echo ${#buff[@]} >> report.log
	fi
done
