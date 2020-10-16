#!/bin/bash

for pid in $(ps -axo pid)
do
	path="/proc/$pid/io"
	if [[ -r $path ]]
	then
		rb=$(cat $path | grep -Esh "read_bytes" | grep -Eso "[0-9]+")
		echo "$pid $rb" >> temp
	fi
done

sleep 60

for pid in $(ps -axo pid)
do
	path="/proc/$pid/io"
	if [[ -r $path ]]
	then
		cur=$(cat $path | grep -Esh "read_bytes" | grep -Eso "[0-9]+")
		prev=$(cat temp | grep -Esh $pid | awk '{print $2}')
		if [[ -n $prev ]]
		then
			res=$(( cur - prev ))
		else
			res=$cur
		fi
		echo $pid":"$res >> tmp
	fi
done
sort -n -k 2 tmp | tail -n 3
rm temp tmp
