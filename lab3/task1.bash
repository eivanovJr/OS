#!/bin/bash

name=$(date +%F_%R)
mkdir ~/test && echo "catalog test was created sucessfully" > ~/report && touch ~/test/$name.tmp
ping -c 1 "www.net_nikogo.net" || echo $name ERROR : unkown adress >> ~/report
