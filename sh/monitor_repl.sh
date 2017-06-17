#!/bin/bash
# -------------------------------------------------------------------------------
# Filename:    monitor_repl.sh
# Revision:    1.0
# Date:        Jun.10th, 2017
# Author:      David Shin
# Description: MySQL Master-Slave status monitor
# Notes:       ...
# -------------------------------------------------------------------------------
HOST_MASTER=192.168.1.1
HOST_SLAVE=192.168.1.2

ACCESS_MASTER="mysql -h ${HOST_MASTER} -uroot -ppassword -P 3306"
ACCESS_SLAVE="mysql -h ${HOST_SLAVE} -uroot -ppassord -P 3306"

declare -a slave_stat
slave_stat=($(${ACCESS_SLAVE} -e "show slave status\G" | grep -i running | awk '{print $2}'))

if [ "${slave_stat[0]}" = "Yes" -a "${slave_stat[1]}" = "Yes" ]; then
    echo "MySQL slave is running..."
    exit 0
else
    echo "MySQL slave is down! Critical!"
    exit 1
fi