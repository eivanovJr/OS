!#/bin/bash

echo "$(wc -l /ar/log/*.log | awk '{if ($2 == "total") print $1}')"
