
#! /bin/bash

#####
# -q quiet
# -c nb of pings to perform
#
# May need to CTRL-Z to break the loop
#
# Written by Joel E White

# VARIABLES
NAME="<NAME>"
CHECK_IP="xxx.xxx.xx.xx"

TIMESTAMP="$(date +%m-%d-%Y::%H:%M:%S)"
BASE_DIR="$(pwd)"
LOG_DIR="${BASE_DIR}/LOGS"
LOG_FILE="${LOG_DIR}/${NAME}_CONNECTION_LOG"



# PRELIMINARY
mkdir -p ${LOG_DIR}
touch ${LOG_FILE}

# MAIN
while true; do
  ping -q -c1 ${CHECK_IP} > /dev/null
  if [[ $? -ne 0 ]]; then
    echo "${TIMESTAMP} -- CONNECTION TO ${NAME} IS DOWN" >> ${LOG_FILE}
  fi
  TIMESTAMP="$(date +%m-%d-%Y::%H:%M:%S)"
done
