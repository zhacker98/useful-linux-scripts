#! /bin/bash

lscpu|grep -i 'L3 cache'|head -n1|tr -s " "|cut -d " " -f 3
