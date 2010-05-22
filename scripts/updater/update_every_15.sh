#!/bin/bash




# This script invokes the power update every 15 minutes

# URL_TO_CURL is the variable which holds the URL that you have to access to start the pull.
URL_TO_CURL=http://access.cws.oregonstate.edu:9003/meters/refresh/1

#until it is ctrl+c or killed 
while true; do

	#get the current minutes (from 00 to 59)
	MINS=`date +%M`
	
	#if it's H:00, H:15, H:30 or H:45 (where H is the hour of the day) it will invoke the pull...
	if [ $MINS = "00" ] || [ $MINS = "15" ] || [ $MINS = "30" ] || [ $MINS = "45" ]; then
		
		# access the url and reroute the output to dev null because we don't care
		curl $URL_TO_CURL >> /dev/null
		
		# get a timestamp
		TS=`date`
		DATE=`date +%m.%d.%y`
		# send an update to a logfile
		# first, check that the current day's logfile exists
		if [ -f $DATE.log ]; then
			#if it does, just output the log message
			echo "$TS: Updated the meters." >> $DATE.log
		else
			#if it doesn't, create it, send a message to the console and then output
			#the log message
			echo "Creating logfile: $DATE.log"
			touch $DATE.log
			echo "$TS: Updated the meters." >> $DATE.log
		fi

		# if the curl took longer than a minute, wait a minute to insure we don't pull again for
		# the same timeframe, otherwise we can just fall out of the loop
		if [ $MINS = `date +%M` ]; then
			sleep 60
		fi
	# since it wasn't time for a poll, we'll wait 30 seconds and check again.
	else
		sleep 30
	fi
done

# curl $URL_TO_CURL >> /dev/null
