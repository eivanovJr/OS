#!/bin/bash

temp="$(ps -u user o pid,command | tail -n +2 | sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/")"

echo "$(wc -l <<< "$temp")" > answer1.bash
echo "$temp" >> answer1.bash
