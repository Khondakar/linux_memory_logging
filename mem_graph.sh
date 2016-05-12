#!/bin/bash
#This takes in a ps log file, and makes a graph of used memory for each process

LOG_FILE=$1
LOG_TEMP_DIR=/tmp/$1_plot

rm -r $LOG_TEMP_DIR
mkdir $LOG_TEMP_DIR

for x in $(cat $LOG_FILE | awk '{print $3}' | sort | uniq);
do 
    cat $LOG_FILE | \
    awk -v var="$x" '{if ($3 == var) print $5}' > $LOG_TEMP_DIR/$x.log
done

export filepath=$LOG_TEMP_DIR
gnuplot --persist  mem_graph.gp
rm -r $LOG_TEMP_DIR
