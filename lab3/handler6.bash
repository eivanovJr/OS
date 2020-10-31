#!/bin/bash

echo $$ > .pid
number=1
mode="+"

sigterm()
{
	echo "SIGTERM SIGNAL STOP"
	exit 0
}
usr1()
{
	mode="+"
}
usr2()
{
	mode="*"
}
trap 'usr1' SIGUSR1
trap 'sigterm' SIGTERM
trap 'usr2' SIGUSR2

while true
do
	sleep 1
	case $mode in
		"+")
			number=$(($number + 2))
			;;
		"*")
			number=$(($number * 2))
			;;
	esac
	echo "$number"
done
