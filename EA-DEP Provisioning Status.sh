#!/bin/bash
#
#
# Created by John Mahlman, University of the Arts Philadelphia (jmahlman@uarts.edu)
# Name: EA-DEP Provisioning Status
#
# Purpose: Find out if the machine has gone through DEP Provisioning by looking for the receipt.
#
# Changelog
#
# 10/18/18 - EA created.
#
#
DEPRECEIPT="/var/db/receipts/com.uarts.provisioning.done.bom"

if [[ -f $DEPRECEIPT ]]; then
	result="Completed"
else
	result="Not Completed"
fi

/bin/echo "<result>$result</result>"
