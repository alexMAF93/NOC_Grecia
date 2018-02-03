#!/bin/bash
echo "Password Request -->1"
echo "Credit Extension -->2"
echo "BalanceInquiry&Recharge -->3"
echo -n "->>"
read optiunezr
case $optiunezr in
1)  ultim=`ls -t pwdlogs | head -1`;
        tail -200f pwdlogs/$ultim;;
2)ultim=`ls -t creditlogs | head -1`;
        tail -200f creditlogs/$ultim;;
3) ultim=`ls -t balancelogs | head -1`;
        tail -200f balancelogs/$ultim;;
esac
