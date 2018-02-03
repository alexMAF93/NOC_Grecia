#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m'
itera=1
if [[ $1 -ne 0 ]]
then
itera=$1
fi
echo "1 --> Peer"
echo "2 --> Port"
echo -n "---->"
read opti
case $opti in
2)
echo -n "Introdu node alias:10.24.64."
read node
rm /home/g05cpirv/loguri/log_port* 2>/dev/null
until [[ $itera -eq 0 ]]
do
date >"/home/g05cpirv/loguri/log_port$itera"
echo >>"/home/g05cpirv/loguri/log_port$itera"
echo -n "Introdu portul: "
read portu
(
echo open 10.24.64.$node
sleep 1
echo aaaa
sleep 1
echo xxxx
sleep 1
echo "show port $portu"
sleep 1
echo q
sleep 1
echo l
sleep 1
 ) | telnet >> "/home/g05cpirv/loguri/log_port$itera" 2>/dev/null
echo
echo
echo
tail -50 /home/g05cpirv/loguri/log_port$itera | more
echo
echo
itera=`expr $itera - 1`
done
;;
1)
#Prima comanda
echo -n "Introdu node alias:10.24.64."
read node
rm /home/g05cpirv/loguri/log_peer* 2>/dev/null
until [[ $itera -eq 0 ]]
do
date > "/home/g05cpirv/loguri/log_peer$itera"
echo >> "/home/g05cpirv/loguri/log_peer$itera"
echo -n "Introdu peer-ul: "
read peeru
(
echo open 10.24.64.$node
sleep 1
echo aaaa
sleep 1
echo xxxx
sleep 1
echo "show router bgp summary all  | match post-lines 1 $peeru"
sleep 1
echo l
sleep 1
) | telnet >> "/home/g05cpirv/loguri/log_peer$itera" 2>/dev/null
echo
echo -ne "${GREEN}#######                33%${NC}     \r"
#A doua comanda
serviciu=`more "/home/g05cpirv/loguri/log_peer$itera" | grep -i svc | awk NR==1'{print $2}'`
inter=`echo $peeru | sed -e 's/\./ /g' | awk '{print $4}'`
interf=$((inter-1))
interfa=`echo $peeru | sed -e 's/\./ /g' | awk '{print $1 "." $2 "." $3 "."}'`
interfata=`echo $interfa $interf | sed -e 's/ //g'`
(
echo open 10.24.64.$node
sleep 1
echo aaaa
sleep 1
echo xxxx
sleep 1
echo "show service id $serviciu interface $interfata"
sleep 1
echo l
sleep 1
) | telnet >> "/home/g05cpirv/loguri/log_peer$itera" 2>/dev/null
echo -ne "${GREEN}##############         66%${NC}     \r"
#Ultima comanda, cu portu
ultim=`more /home/g05cpirv/loguri/log_peer$itera | grep -a VPRN | wc -w`
por=`more "/home/g05cpirv/loguri/log_peer$itera" | grep -a VPRN | awk NR==1'{print $"'"$ultim"'"}'`
portu=`echo $por | sed -e 's/:/ /g' | awk '{print $1}'`
(
echo open 10.24.64.$node
sleep 1
echo aaaa
sleep 1
echo xxxx
sleep 1
echo "show port $portu"
sleep 1
echo l
sleep 1
) | telnet >> "/home/g05cpirv/loguri/log_peer$itera" 2>/dev/null
echo -ne "${GREEN}##################### 100%${NC}     \r"
sleep 1
echo
echo
#more "/home/g05cpirv/loguri/log_peer$itera" | egrep -a port\|"Admin S"\|"Oper S"\|Description
tail -50 /home/g05cpirv/loguri/log_peer$itera | more
echo
echo
itera=`expr $itera - 1`
done
;;
esac
