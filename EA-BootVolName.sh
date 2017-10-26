#!/bin/bash
#
#
# Created by John Mahlman, University of the Arts Philadelphia (jmahlman@uarts.edu)
# Name: EA-BootVolName.sh
#
# Purpose: Casper extension attribute to get the boot volume name. I made this
# to find machines that didn't have the volume "Macintosh HD" and rename it.
#
# Changelog
# 10/26/17 - EA created.
#
#
# Finds the current boot volume
bootVolume=`/usr/sbin/bless --info --getboot`
# Pull the name of the boot volume
bootVolumeName=`/usr/sbin/diskutil info $bootVolume | grep "Volume Name" | sed 's/.*://g' | awk '{$1=$1};1'`

echo "<result>$bootVolumeName</result>"
