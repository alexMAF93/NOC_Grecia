#!/bin/bash
cale=~/health_check_MDA

cat $cale | egrep -a "Trap raised"\|Connected\|EEST\|EET\|$B:P\|MDA\|"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" | egrep -v Specific\|logout\|"Press any key" | less
