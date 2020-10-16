#!/bin/bash

for pid in $(ps -axo pid)
do
	stats="/proc/"$pid"/status"
	sch="/proc/"$pid"/sched"
	ppid=$(grep -Esh "PPid" $stats | grep -Eso "[0-9]+")
	runt=$(grep -Esh "se.sum_exec_runtime" $sch | grep -Eso "[0-9]+\.[0-9]+")
	sw=$(grep -Esh "nr_switches" $sch | grep -Eso "[0-9]+")
	if [[ -n $ppid ]]
	then
	art=$(echo "scale=10; x=$runt/$sw; if (x<1 && x!=0) print 0; x" | bc)
	echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art"
	fi
done | sort -n -t "=" -k3 > answer4.bash
