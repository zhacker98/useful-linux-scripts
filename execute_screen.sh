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
BaseDir=$(pwd)
ScreenName=$1
LogFile="${BaseDir}/${ScreenName}_Session.log"
Commands=$2
Screen=$(which screen)

# PRE
if [ $# -ne "2" ]; then
  echo ${Usage}
  exit
fi

# MAIN
${Screen} -S ${ScreenName} -L -dm bash -c "${Commands}"

CheckForLog=$(find ${BaseDir} -maxdepth 1 -type f -cmin -1 -name 'screenlog.*')

echo 'Use the following to reattach to your screen session' | tee -a ${LogFile}
echo "screen -r ${ScreenName}" | tee -a ${LogFile}
echo | tee -a ${LogFile}
sleep 1

echo "Log file found is: ${CheckForLog}" | tee -a ${LogFile}
echo | tee -a ${LogFile}
sleep 2

echo "Tailing log of ${ScreenName} now" | tee -a ${LogFile}
echo "tail -f ${CheckForLog}" >> ${LogFile}
sleep 2
tail -f ${CheckForLog}


