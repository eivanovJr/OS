#!/bin/bash

echo "1. Open nano"
echo "2. Open vi"
echo "3. Open links"
echo "4. Exit"
read choice
case $choice in
1 )
nano
;;
2 )
vi
;;
3 )
links
;;
4 )
exit 0
;;
esac
