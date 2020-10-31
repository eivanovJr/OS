#!/bin/bash

while true
do
	read line
	case "$line" in
		TERM)
			kill -SIGTERM $(cat .pid)
			;;

		"+")
			kill -SIGUSR1 $(cat .pid)
			;;
		"m")
			kill -SIGUSR2 $(cat .pid)
			;;
		*)
			:
			;;
	esac
done
