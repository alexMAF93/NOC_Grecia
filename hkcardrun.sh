 #!/bin/bash
filename=/home/g05cpirv/bin/lista
cpnnode=(`cat "$filename"`)
cale=/home/g05cpirv/loguri/health_check_Card
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
echo g05gpoal
sleep 1
echo Vodafone1!
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
