#!/bin/bash
./temp4.bash&
pid1=$!
./temp4.bash&
pid2=$!
./temp4.bash&
pid3=$!


renice +10 -p $pid1

top

kill $pid3

top

kill $pid2
kill $pid1

echo $pid1
echo $pid2
echo $pid3

