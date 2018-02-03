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
1) tail -1200 log1 | egrep ERROR\|'5[0-9][0-9]'$   | grep m-send-req;;
2) tail -1200 log2 | egrep "Unable To Send"\|"Message Not Sent"\|"Message Failed Invalid Sender" | grep m-send-conf;;
3) tail -1200 log1 | grep '5[0-9][0-9]'$  | grep GET;;
4) tail -1200 log1 | grep '5[0-9][0-9]'$  | grep m-notifyresp-ind;;
5) tail -1200 log1 | grep '5[0-9][0-9]'$  | grep m-acknowledge-ind;;
6) tail -1200 log1 | grep '5[0-9][0-9]'$  | grep m-read-rec-ind;;
esac;;
2) tail -1200  international_logs | grep Deferred;
tail -1200 international_logs | grep "Service unavailable" | grep -v mms.xxxx.gprs;;
3) echo "WIND -->1"
   echo "COSMOTE -->2"
   echo "AICENT -->3"
   echo "MM4-Proxy -->4"
   echo -n "->>"
read optiunezr4
case $optiunezr4 in
1) telnet xxx.xx.xx.xx 25 ;;
2) telnet xxx.xxx.xx.xxx 25 ;;
3) telnet xx.xx.xxx.xxx 25 ;;
4) telnet xx.xxx.xxx.xx 25;;
esac;;
4)echo -n "Transaction ID / MSISDN : "
read TID
cat log1 | grep $TID;
cat log2 | grep $TID
;;
5)
echo "=========================================================";;
esac
