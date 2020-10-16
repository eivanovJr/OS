#!/bin/bash

echo "$(ps axo rss,command --sort -rss | head -n 2)" 
