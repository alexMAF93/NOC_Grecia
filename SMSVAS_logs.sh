#!/bin/bash
echo "Password Request -->1"
echo "Credit Extension -->2"
echo "BalanceInquiry&Recharge -->3"
echo -n "->>"
read optiunezr
case $optiunezr in
1)  ultim=`ls -t /exomi/log/PwdRetrieval/ | head -1`;
        tail -200f /exomi/log/PwdRetrieval/$ultim;;
2)ultim=`ls -t /exomi/log/credit_extensionNEW_log/ | head -1`;
        tail -200f /exomi/log/credit_extensionNEW_log/$ultim;;
3) ultim=`ls -t /exomi/log/prepaybalance/ | head -1`;
        tail -200f /exomi/log/prepaybalance/$ultim;;
esac
