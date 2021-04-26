#! /bin/bash

#space=`df -h | awk '{print $1, $6, $5}' |grep -v Mounted | grep "/ "`
space=`df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -`

# This script does a very simple test for checking disk space.

case $space in
#[1-6]*)
 # Message="All is quiet."
  #;;
[7-8]*)
  Message="There's a partition that is $space % full."
  ;;
9[1-8])
  Message="One partition is $space % full."
  ;;
99)
  Message="There's a partition at $space %!"
  ;;
*)
  Message="Nonexistent amount of disk space..."
  ;;
esac

echo $Message | mail -s "Server Disk space report `date`" user@user.com
