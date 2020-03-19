#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m'
filename=~/lista2
# cpnnode=(`cat "$filename"`)
cale=~/ssh_health_check
opti=0
echo
echo
echo -ne "${GREEN} Health Check pentru Carduri${NC}"
echo
echo
for i in `cat $filename`
do
ssh aaaa@$i "show card detail" > $cale
cat $cale | egrep -a "Trap raised"\|Connected\|"card detail"\|Card\|Trap\|"XPL Errors"\|"chip Errors Detected" | egrep -va "Specific"\|logout\|"Press any key"
echo
echo
echo "Working on $i ..."
echo
echo "pentru a trece la urmatorul nod apasa ENTER"
echo
echo
read opti
case $opti in
1);;
esac
done
echo
echo
echo -ne "${GREEN}Health Check pentru MDA-uri${NC}"
echo
echo
for i in `cat $filename`
do
ssh aaaa@$i "show mda detail" > $cale
cat $cale | egrep -a "Trap raised"\|Connected\|"mda detail"\|MDA | egrep -av Specific\|logout\|"Press any key"
echo
echo
echo "Working on $i ..."
echo
echo "pentru a trece la urmatorul nod apasa ENTER"
echo
echo
read opti
case $opti in
1);;
esac
done
