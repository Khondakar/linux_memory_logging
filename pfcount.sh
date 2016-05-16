#!/bin/bash
#This takes in a ipmv log file, and makes a graph of X used

LOG_FILE=$1
LOG_TEMP_DIR=/tmp/$1_plot
LOG_EXT=log

rm -r $LOG_TEMP_DIR
mkdir $LOG_TEMP_DIR

#echo Getting player list
#num_pids=$(cat $LOG_FILE | grep "aq=" | grep "\[Player" | awk '{print $2}' | sort | uniq | wc -w)
#echo Found $num_pids players

#Get all unique players from the file, then loop through and output their mem use
echo Parsing File...
for x in 1
#$(cat $LOG_FILE | grep "aq=" | grep "\[Player" | awk '{print $2}' | sort | uniq);
do 
#    cat $LOG_FILE | \
#    grep "Mbit" | awk -F'[\[M]' '{print $5}' > $LOG_TEMP_DIR/1.$LOG_EXT
    cat $LOG_FILE | \
    grep "Gbps" | awk -F'[\[G]' '{print $5}' > $LOG_TEMP_DIR/2.$LOG_EXT

#grep "Mbit" | awk -F'[=K]' '{print $3}' > $LOG_TEMP_DIR/$x.$LOG_EXT
    #echo -ne $num_pids 'players left\r'
    #num_pids=$((num_pids-1))
done

#ps will track lots of threads, so delete entries that are small
echo Deleting Files...
find $LOG_TEMP_DIR -name "*.$LOG_EXT" -size -100c -delete

echo Generating Graph...
export filepath=$LOG_TEMP_DIR
gnuplot --persist  mem_graph.gp
#rm -r $LOG_TEMP_DIR
