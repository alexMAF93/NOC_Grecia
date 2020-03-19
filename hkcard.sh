#!/bin/bash
cale=~/health_check_Card
cat $cale | egrep -a "Trap raised"\|Connected\|EEST\|EET\|$B:P\|Card\|Trap\|"XPL Errors"\|"chip Errors Detected"\|"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" | egrep -va "Specific"\|logout\|"Press any key" | less
