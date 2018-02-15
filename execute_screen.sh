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
Screen=$(which screen)

# PRE
if [ $# -ne "2" ]; then
  echo ${Usage}
  exit
fi

if [ ${Screen} -z ]; then
  echo 'Screen not found'
  sleep 1
  echo 'Installing Screen'
  apt-get install -y -q screen
fi

# MAIN
${Screen} -S ${ScreenName} -dm bash -c "${Commands}"
