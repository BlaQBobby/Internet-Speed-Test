#!/bin/bash
#A bash file to monitor and store results of your internet speed test
#file would by default be stored in your user root directory
#Note: Used the speedtest-cli. If you don't have this installed, run <sudo apt-get speedtest-cli> on your command line
#

echo -e "Enter file to store speed test results: " 
read filename
echo -e "Enter interval to run speed test at (mins): " 
read interval


newinterval=$(( $interval * 60 ))

while :
do
	now=$(date +"%T")
	echo $now >> $filename
	echo "Current Internet speed details being written to... $filename "
	speedtest-cli >> $filename
	sleep $newinterval;
done
