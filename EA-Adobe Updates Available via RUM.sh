#!/bin/bash
#
#
# Created by John Mahlman, University of the Arts Philadelphia (jmahlman@uarts.edu)
# Name: EA-Adobe Updates Available via RUM
#
# Purpose: Casper extension attribute for letting us know if there are any Adobe updates using RUM
#
# Changelog
#
#	2/22/18	-	Cleaed up some logic to make it prettier.
# 2/27/17 - EA created.
#
#
rumlog=/var/tmp/RUMupdate.log
rum=/usr/local/bin/RemoteUpdateManager

# Not that it matters but we'll remove the old log file if it exists
if [[ -f $rumlog ]] ; then
	rm $rumlog
fi

#run RUM and output to the log file
touch $rumlog
$rum --action=list > $rumlog

if [[ -f $rum ]]; then
	if [[ "$(grep "Following Updates are applicable" $rumlog)" ]] ; then
		result="Updates Available"
	else
		result="No Updates"
	fi
else
	result="RUM not found"
fi

/bin/echo "<result>$result</result>"
