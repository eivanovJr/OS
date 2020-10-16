#!/bin/bash

prev=-1
sum=0
count=0 

while read line
do
	ppid=$(echo $line | cut -d ":" -f 2 | grep -Eso "[0-9]+")
	art=$(echo $line | cut -d ":" -f 3 | grep -Eso "[0-9]+(\.[0-9]+)?")
	if (( prev != -1 && ppid != prev ))
	then
	echo "Average_Sleeping_Children_of_ParentID=$prev is $(echo "scale=3; x=$sum / $count; if (x<1 && x!=0) print 0; x" | bc)"
		sum=0
		count=0
	fi
	sum=$(echo "scale=3; $sum + $art" | bc)
	prev=$ppid
	((count++))
done < answer4.bash > answer5.bash
