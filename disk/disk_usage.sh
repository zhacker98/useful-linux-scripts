#! /bin/bash

# Check Disk Usage on the root partition of a list of servers
#
#   Written by Joel E White
#

# Variable Definitions
base_dir="/root"
working_dir="${base_dir}/disk_usage"
log_file="${working_dir}/disk-usage_$(date +%m-%d-%Y)"

# Edit this list with the servers you want to check, either fqdn or IP
server_list='
server1
server2
server3
'

# Preliminary
mkdir -p ${working_dir}

if [[ -f ${log_file} ]]; then
    echo "Logfile already exists for today"
  else
    log_file="${log_file}-$(date +%H:%M:%S)"
    touch ${log_file}
fi

for i in ${server_list}; do
  echo "Checking -- ${i} -- Disk Space -- *********" >> ${log_file}
  ssh ${i} 'df -h /' >> ${log_file}
  echo >> ${log_file}
done

echo "Check ${working_dir} for today's log"
