#! /bin/bash

#####
#
#   A Script to check if you have auth on a list of servers
#
#   Written by Joel E White
#
#####

# VAR
BaseDir=$(pwd)
LogDir="${BaseDir}/auth_check-logs"
LogFile="${LogDir}/auth_check-log_$(date +%Y-%m-%d_%H:%M)"

SshOption1="-oConnectTimeout=5"
SshOption2="-oStrictHostKeyChecking=no"
SshOption3="-oPasswordAuthentication=no"

CommandsToRun="whoami; hostname -f"

ServerList="$(cat /dir/to/server.list)"


# PRE

mkdir -p ${LogDir}
touch ${LogFile}

# MAIN
for hOst in ${ServerList}
  do echo ">>---- ${hOst} ----<<" | tee -a ${LogFile}
  ssh ${ShhOption1} ${SshOption2} ${SshOption3} ${hOst} ${CommandsToRun} | tee -a ${LogFile}
  echo '<<---- ** ---->>' | tee -a ${LogFile}
done
