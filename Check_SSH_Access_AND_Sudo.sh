#! /bin/bash

#####
#
#   A Script to Check current user SSH Access and Sudo Access for a given server
#
#       Written by Joel E White @2018
#
#####

# VAR
Usage='./script <server_name_or_ip>'
Server=$1

# PRE
if [ $# -ne "1" ]; then
	echo ${Usage}
	exit
fi

# MAIN
ssh ${Server} -o PasswordAuthentication=No 'echo "SERVER NAME:$(hostname -f)"; echo "CURRENT DATE:$(date +%Y-%m-%d_%H::%S)"; echo "WHO AM I? $(whoami)"; echo "CHECKING TO SEE IF >>::$(whoami)::<< IS IN THE SUDO GROUP"; cat /etc/group|grep sudo|grep $(whoami)'
