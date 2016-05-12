#!/bin/bash

LOG_FILE=$1

gnuplot --persist -e "set key outside; set key right; \
    plot '$LOG_FILE' using 0:4 with lines title 'Total', 
    '' using 0:5 with lines title 'Used', 
    '' using 0:6 with lines title 'Free';"

