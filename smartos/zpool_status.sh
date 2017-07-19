#! /bin/bash

# Zpool Status -- Checks the status of zpools on SmartOS/Solaris Servers
#
#   Written by Joel E White
#              -- 2017

server_list='
server1
server2'

base_dir="/root"
working_dir="${base_dir}/zpool_status"
log_file="${working_dir}/zpool_status-$(date +%m%d%Y)"

# Preliminary Stuff
mkdir -p ${working_dir}

if [[ -f ${log_file} ]]
  then
    log_file=${working_dir}/zpool_status-$(date +%m%d%Y)-$(date +%H:%M:%S)
    touch ${log_file}
  else
    touch ${log_file}
fi

echo "Logfile is ${log_file}"
sleep 2

# Main Script
echo "Checking Zpool Status"

for i in ${server_list};
  do echo '**********************' >> ${log_file}
  echo >> ${log_file}
  echo "${i} ----****" >> ${log_file}
  echo >> ${log_file}
  echo "Current Time is : $(date +%m-%d-%Y_%H:%M)" >> ${log_file}
  ssh ${i} 'zpool status -x' >> ${log_file}
  echo >> ${log_file}
done

echo "Check ${working_dir} for todays logfile"
