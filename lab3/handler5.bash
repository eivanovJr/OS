#!/bin/bash

number=1
mode="+"

tail -f pipe | 
while true
do
	read line
	case "$line" in
		QUIT)
			echo "Quit command"
			killall tail
			exit 0
			;;
		"m")
			mode="*"
			;;
		+)
			mode="+"
			;;
		[0-9]*)
			case $mode in
				"+")
					num=$(($num + $line))
					echo $num
					;;
				"*")
					num=$(($num * $line))
					echo $num
					;;
			esac
			;;
		*)
			echo "Incorrect Input $mode"
			killall tail
			exit 1
			;;
	esac
done
