#!/bin/bash


filename=~/lista
# cpnnode=(`cat "$filename"`)
cale=~/health_check_Card
date > $cale
echo >> $cale
printf '\n\n\n' >> $cale


for i in `cat $filename`
do
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >>$cale

    (echo open "${i}"
    sleep 1 
    echo aaaa
    sleep 1
    echo xxxx
    sleep 1
    echo show card detail
	   sleep 1
	   while true
	   do
		      echo l
		      sleep 1
	   done
	   ) | telnet >> $cale 2>/dev/null
done
