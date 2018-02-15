#! /bin/bash

#####
#
#   A Script to launch a Named Screen Session
#     Run a set of commands or single command and automatically dettach
#
#   Written by Joel E White @2018
#
#       This Script requires that you have GNU-Screen installed
#           apt-get install -y -q screen
#             Adding a -L flag to the command will log output to current working directory as screenlog.*
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

# MAIN
${Screen} -S ${ScreenName} -dm bash -c "${Commands}"
