#!/bin/bash
> 1.2.mem
> 1.2.swap
> 1.2.info
while true
do
	sleep 1s
	proc=$(top -b -n 1 | grep -E "mem[2]*.bash")
	if [ -n "$proc" ]
	then
		echo "System parameters" >> 1.2.info
		echo $(top -b -n 1 | grep -E "MiB Mem") >> 1.2.info
		echo $(top -b -n 1 | grep -E "MiB Swap") >> 1.2.info
		echo $(top -b -n 1 | grep -E "MiB Mem" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1) >> 1.2.mem
		echo $(top -b -n 1 | grep -E "MiB Swap" | grep -Eo "[0-9]+" | awk '{print $1}'| head -n 3 | tail -n 1) >> 1.2.swap
		echo >> 1.2.info
		echo "mem[2]+.bash info" >> 1.2.info
		echo $proc >> 1.2.info
		echo >> 1.2.info
		echo "Five processes" >> 1.2.info
		echo $(top -b -n 1 | head -n 12 | tail -n 5) >> 1.2.info
		echo >> 1.2.info	
	else
		echo $(dmesg | grep "mem.bash" | tail -n 2) >> 1.2.info
		echo $(dmesg | grep "mem2.bash" | tail -n 2) >> 1.2.info
		echo "exit"
		exit
	fi
done
