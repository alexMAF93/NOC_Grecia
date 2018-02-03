#!/bin/bash
cale=~/health_check_MDA
filename=~/bin/lista
cpnnode=(`cat "$filename"`)
date > $cale
echo >> $cale
echo
echo
echo


for i in {0..50}
do
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$cale
(echo open "${cpnnode[$i]}"
sleep 1
echo aaaa
sleep 1
echo xxxx
sleep 1
echo show mda detail
sleep 1
while true
do
echo l
sleep 1
done
) | telnet >>$cale 2>/dev/null
done
