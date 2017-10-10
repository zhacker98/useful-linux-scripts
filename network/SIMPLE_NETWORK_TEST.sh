#!/bin/sh

# To elaborate, one might substitute google.com for ARG1 and make the script more dynamic and scriptable 

# -q quiet
# -c nb of pings to perform

ping -q -c5 google.com > /dev/null

if [ $? -eq 0 ]
then
	echo "ok"
fi
