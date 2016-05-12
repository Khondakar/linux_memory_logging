#!/bin/bash

LOG_FILE=$(date +'%Y%m%d-%H%M%S')_mem.log
>$LOG_FILE

while true
do
    ps --no-headers -p $(pidof /home/cayman/providius_widgets/providius_widgets | \
        sed "s//,/g"),$(pidof python | sed "s/ /,/g") -o pid,vsz,rss,args | \
        awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' >> $LOG_FILE
        sleep 10
done

