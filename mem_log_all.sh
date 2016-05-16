#!/bin/bash

LOG_FILE=$(date +'%Y%m%d-%H%M%S')_mem_all.log
>$LOG_FILE

while true
do
    ps --no-headers x -o pid,vsz,rss,args | \
    awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' >> $LOG_FILE
    sleep 10
done
