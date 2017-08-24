#! /bin/bash

# Variables
PKG_INSTALL='
apt-get install -y sysstat
'
ENABLE_SYS='
sed -i s/false/true /etc/default/sysstat
'
START_SYS='
/etc/init.d/sysstat start
'
CHECK_SYS='
sar -b|head -n3; sar -b|tail -n 5; echo "----"; sar -u|head -n 3; sar -u|tail -n 5
'

if [ $(ls /etc/default/sysstat) -lt 1 ]; then
  ${PKG_INSTALL}
fi

${ENABLE_SYS}

${START_SYS}

${CHECK_SYS}
