#!/usr/bin/env bash

set -x 

if [ -z $1 ]; then
	echo "usage: check_running.sh <name of vm>"
else
	if [ -z "$(openstack server list | grep $1)" ]; then
		echo "Server $1 does not exist"
	else
		echo "Server $1 exists"
	fi
fi

