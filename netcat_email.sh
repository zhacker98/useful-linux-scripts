# DERIVED FROM https://www.linuxjournal.com/content/sending-email-netcat
#! /bin/bash

#####
#
#   A Script to send an email via netcat to a given smtp server
#
#####

# VAR
Usage='./script <from> <to> <subject> <body>'

NC=$(which nc)

Date=$(date '+%a, %d %b %Y %H:%M:%S %z')
From=$1
To=$2
Subject=$3
Body=$4

SMTPserver='smtp.example.com'
SMTPport='25'

Message="
HELO ${SMTPserver}
   MAIL FROM:<test@host.example.com>
   RCPT TO:<${To}>
   DATA
   From: [Alice] <${From}>
   To: <${To}>
   Date: ${Date}
   Subject: ${Subject}

   ${Body}


   .
   QUIT
   "

# PRE

if [ $# -ne "4" ]; then
  echo ${Usage}
  exit
fi

# MAIN

${NC} ${SMTPserver} ${SMTPport} < ${Message}
