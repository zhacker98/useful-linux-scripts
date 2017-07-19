#! /bin/bash

# Network Scan -- Checks the network by pinging hosts and only logging hosts that return icmp
#
#   Written by Joel E White
#              -- 2017

first_octets="192.168.100"
base_dir=/root
working_dir=${base_dir}/network_scan
log_file=${working_dir}/network_scan-$(date +%m%d%Y)

# Preliminary Stuff
mkdir -p ${working_dir}

if [[ -f ${log_file} ]]
then
  log_file=${working_dir}/network_scan-$(date +%m%d%Y)-$(date +%H:%M:%S)
  touch ${log_file}
else
  touch ${log_file}
fi

echo "Logfile is ${log_file}"
sleep 2

# Main Script
echo "Checking the Network"

for i in {1..255};
  do ping -c 1 ${first_octets}.${i}|tail -4|grep -B 1 "1 received" | tee ${log_file}
done

echo "Check ${working_dir} for todays logfile"
