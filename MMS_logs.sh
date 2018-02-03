#!/bin/bash
echo "Alege din optiunile de mai jos:"
echo "Erori din Traficul MM1 --> 1"
echo "Erori din Traficul MM4 --> 2"
echo "Verificare conexiuni -->3"
echo "Cauta dupa Transaction ID / MSISDN -->4"
echo "Nimic -->5"
echo -n "->>"
read optiunezr
case $optiunezr in
1)echo "pentru m-send-req -->1"
echo "pentru m-send-conf -->2"
echo "pentru GET -->3"
echo "pentru m-notifyresp-ind -->4"
echo "pentru m-acknowledge-ind -->5"
echo "pentru m-read-rec-ind -->6"
echo -n "->>"
read optiunezr2
case $optiunezr2 in
1) tail -1200 /var/log/simple-emmp.log | egrep ERROR\|'5[0-9][0-9]'$   | grep m-send-req;;
2) tail -1200 /var/log/emmp.log | egrep "Unable To Send"\|"Message Not Sent"\|"Message Failed Invalid Sender" | grep m-send-conf;;
3) tail -1200 /var/log/simple-emmp.log | grep '5[0-9][0-9]'$  | grep GET;;
4) tail -1200 /var/log/simple-emmp.log | grep '5[0-9][0-9]'$  | grep m-notifyresp-ind;;
5) tail -1200 /var/log/simple-emmp.log | grep '5[0-9][0-9]'$  | grep m-acknowledge-ind;;
6) tail -1200 /var/log/simple-emmp.log | grep '5[0-9][0-9]'$  | grep m-read-rec-ind;;
esac;;
2) tail -1200  /var/log/maillog/maillog | grep Deferred;
tail -1200 /var/log/maillog/maillog | grep "Service unavailable" | grep -v mms.mnc005.mcc202.gprs;;
3) echo "WIND -->1"
   echo "COSMOTE -->2"
   echo "AICENT -->3"
   echo "MM4-Proxy -->4"
   echo -n "->>"
read optiunezr4
case $optiunezr4 in
1) telnet 212.152.85.211 25 ;;
2) telnet 195.167.65.220 25 ;;
3) telnet 64.124.233.174 25 ;;
4) telnet 85.205.200.37 25;;
esac;;
4)echo -n "Transaction ID / MSISDN : "
read TID
cat /var/log/simple-emmp.log | grep $TID;
cat /var/log/emmp.log | grep $TID
;;
5)
echo "=========================================================";;
esac
