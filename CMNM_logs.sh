#!/bin/bash
GREEN='\033[0;32m'
RED='\033[4;7;31m'
NC='\033[0m'
cale1='logs'
cale2='output'

a1=`tail -57 $cale1 | head -55 | grep -ci 'All Disks & Mirrors are OK'`
a2=`tail -57 $cale1 | head -55 | grep -ci 'Filesystem ok'`
a3=`tail -57 $cale1 | head -55 | grep -ci 'All FANs are OK'`
a4=`tail -57 $cale1 | head -55 | grep -ci 'The Temperature is OK'`
a5=`tail -57 $cale1 | head -55 | grep -ci 'All Current sensors are OK'`
a6=`tail -57 $cale1 | head -55 | grep -ci 'All Voltages are OK'`
a7=`tail -57 $cale1 | head -55 | grep -ci 'All FRUs are OK'`
a=$((a1+$a2+$a3+$a4+$a5+$a6+$a7))
b=`tail -57 $cale1 | head -55 | grep -ci 'CPU utilization is normal'`
c=`tail -57 $cale1 | head -55 | grep -ci 'All CPUs are on-line'`

if [ $a1 -eq 2 ] && [ $a2 -eq 4 ] && [ $a3 -eq 2 ] && [ $a4 -eq 2 ] && [ $a5 -eq 2 ] && [ $a6 -eq 2 ] && [ $a7 -eq 2 ] && [ $b -eq 2 ] && [ $c
-eq 2 ]
then
echo >>$cale2
tail -64 $cale1 | egrep EET\|EEST>> $cale2
echo >> $cale2
echo -e "${GREEN}Hardware checks OK: $a / 16${NC}">>$cale2
echo -e "${GREEN}CPU utilization OK:  $b / 2${NC}" >>$cale2
echo -e "${GREEN}CPUs online       :  $c / 2${NC}" >> $cale2
elif [ $a1 -ne 2 ] || [ $a2 -ne 4 ] || [ $a3 -ne 2 ] || [ $a4 -ne 2 ] || [ $a5 -ne 2 ] || [ $a6 -ne 2 ] || [ $a7 -ne 2 ] || [ $b -ne 2 ] || [ $
c -ne 2 ]
then
echo>>$cale2
tail -70 $cale1 >> $cale2
echo >>$cale2
echo >>$cale2
tail -70 $cale1 | egrep EET\|EEST>>$cale2
echo >>$cale2
echo -e "${RED}Hardware checks OK: $a / 16${NC}">>$cale2
echo -e "${RED}CPU utilization OK: $b / 2${NC}" >>$cale2
echo -e "${RED}CPUs online       : $c / 2${NC}" >> $cale2
echo >> $cale2
fi
