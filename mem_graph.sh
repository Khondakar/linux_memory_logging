#!/bin/bash
#This takes in a ps log file, and makes a graph of used memory for each process

LOG_FILE=$1
LOG_TEMP_DIR=/tmp/$1_plot
LOG_EXT=log

rm -r $LOG_TEMP_DIR
mkdir $LOG_TEMP_DIR

num_pids=$(cat $LOG_FILE | awk '{print $3}' | sort | uniq | wc -w)

#Get all unique pid's from the file, then loop through and output their mem use
echo Parsing File...
for x in $(cat $LOG_FILE | awk '{print $3}' | sort | uniq);
do 
    cat $LOG_FILE | \
    awk -v var="$x" '{if ($3 == var) print $5}' > $LOG_TEMP_DIR/$x.$LOG_EXT
    echo -ne $num_pids 'pids left\r'
    num_pids=$((num_pids-1))
done

#ps will track lots of threads, so delete entries that are small
echo Deleting Files...
find $LOG_TEMP_DIR -name "*.$LOG_EXT" -size -100c -delete

echo Generating Graph...
export filepath=$LOG_TEMP_DIR
gnuplot --persist  mem_graph.gp
#rm -r $LOG_TEMP_DIR
