#!/bin/bash
cale=/home/g05cpirv/loguri/health_check_MDA

cat $cale | egrep -a "Trap raised"\|Connected\|EEST\|EET\|$B:P\|MDA\|"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~" | egrep -v Specific\|logout\|"Press any key" | less
