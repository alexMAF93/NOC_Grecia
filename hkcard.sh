#!/bin/bash
cale=/home/g05cpirv/loguri/health_check_Card
cat $cale | egrep -a "Trap raised"\|Connected\|EEST\|EET\|$B:P\|Card\|Trap\|"XPL Errors"\|"chip Errors Detect
ed"\|"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" | egrep -va "Specific"\|logout\|"Press any key" | le
ss
