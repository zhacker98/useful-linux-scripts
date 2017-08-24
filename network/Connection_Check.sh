#! /bin/bash

echo "----CTRL-C to break the loop____"
sleep 5

echo "----Checking Connections____ $(date +%H:%M::%S)"

while true; do lsof -i|wc -l; echo "----CURRENT OPEN CONNECTIONS____ $(date +%H:%M::%S)"; sleep 5; done
