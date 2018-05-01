#! /bin/bash

#######
#
#   A Script to check checksums, and generate checksums for those without
#
#     Written by Joel E White @2018
#
#######

# VAR
SCAN_DIR="$1"
EXTEN="$2"

TMP_COUNTER="$(pwd)/tmp.counter"

Usage="./script <directory_to_scan> <extension>"

# PRE
if [ $(ls ${TMP_COUNTER}|wc -l) -ne "0" ]; then
  rm ${TMP_COUNTER}  
fi

touch ${TMP_COUNTER}


for i in $(ls ${SCAN_DIR}/*.${EXTEN}); do ls ${i}|grep -v 'sha256' >> ${TMP_COUNTER}; done

for i in $(cat ${TMP_COUNTER}|grep -v 'tmp.counter'); do sha256sum ${i} > ${i}.sha256; done


# MAIN

#for i in $(ls /root/Cron/*.sh); do sha256sum ${i} > ${i}.sha256; done

cd ${SCAN_DIR}; for i in $(ls ${SCAN_DIR}/*.sha256); do cat ${i}|sha256sum -c; done

rm ${TMP_COUNTER}
