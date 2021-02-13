#!/usr/bin/env bash

# curl an ip every second.
# if no ip is specified, it curls balancer

BALANCER=10.212.138.40
if [ -z $1 ]; then
	while true; do curl $BALANCER; sleep 1; done;
else
	while true; do curl $1; sleep 1; done;
fi

