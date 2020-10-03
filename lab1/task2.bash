#!/bin/bash

read str
while [[ "$str" != "q" ]]
do
result="$result$str"
read str
done
echo $result
exit 0
