#! /bin/bash

#####
#
#   A Script to launch a Named Screen Session
#     Run a set of commands or single command and automatically dettach
#
#   Written by Joel E White @2018
#
#####

# VAR
Usage="./script <screen_name> '<commands_to_run>' "
ScreenName=$1
Commands=$2

# PRE
if [ $# -ne "2" ]; then
  echo ${Usage}
  exit
fi

# MAIN

screen -S ${ScreenName} -dm bash -c "${Commands}"
