#! /bin/bash

#####
#
#	A Script to cleanup screen sessions and files after running execute_screen.sh
#
#		Written by Joel E White @2018
#
#####

# VAR
Usage='./script <session_log>'

SessionLog=$1
WhichLog=$(cat ${SessionLog}|grep Log|cut -d ':' -f 2)
WhichScreen=$(cat ${SessionLog}|grep 'screen -r'|cut -d ' ' -f 3)


# PRE

# MAIN

echo "Quitting ${WhichScreen}"
screen -X -S ${WhichScreen} quit

echo "Removing ${WhichLog}"
rm ${WhichLog}

