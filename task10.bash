#!/bin/bash

echo "$(man bash | tr -s " " | tr ' ' '\n' | grep -E '....+' | sort -i | uniq -ic | sort -rnk 1 | head -n 3 | awk '{print $2}')"
