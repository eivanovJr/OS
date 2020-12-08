#!/bin/bash

>1.1.info
>1.1.mem
>1.1.swap

while true
do
	sleep 1s
	proc=$(top -b -n 1 | grep -E "mem.bash")
	if [[ -n "$proc" ]]
	then
		echo "Memory params" >> 1.1.info
		echo $(top -b -n 1 | grep -E "MiB Mem") >> 1.1.info
		echo $(top -b -n 1 | grep -E "MiB Swap") >> 1.1.info
		echo $(top -b -n 1 | grep -E "MiB Mem" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1) >> 1.1.mem
		echo $(top -b -n 1 | grep -E "MiB Swap" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1) >> 1.1.swap
		echo "mem.bash info" >> 1.1.info
		echo $proc >> 1.1.info	
		echo "Five processes" >> 1.1.info
		echo $(top -b -n 1 | head -n 12 | tail -n 5) >> 1.1.info 
		
	else
		echo >> 1.1.info
		echo $(dmesg | grep "mem.bash" | tail -n 2) >> 1.1.info
		echo "exit"
		exit
	fi
			
done

