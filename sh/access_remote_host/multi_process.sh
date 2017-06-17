#!/bin/bash
# -------------------------------------------------------------------------------
# Filename:    multi_process.sh
# Revision:    1.0
# Date:        Jun.10th, 2017
# Author:      David Shin
# Description: Multiply access remote hosts without interaction.
# Notes:       ...
# -------------------------------------------------------------------------------
cat ./host.list | while read line
do
	host=`echo $line | awk '{print $1}'`
	user=`echo $line | awk '{print $2}'`
	pass=`echo $line | awk '{print $3}'`
	./exp_access_host $host $user $pass
done