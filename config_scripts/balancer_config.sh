#!/usr/bin/env bash

# configuration for installing haproxy, copying haproxy.cfg, etc goes here

sudo apt-get update
sudo apt-get install haproxy net-tools -y

MANAGER=192.168.128.142
scp ubuntu@$MANAGER:~/haproxy.cfg /etc/haproxy/haproxy.cfg	# not a real path yet. todo: find a place to store the conf
haproxy -c -f /etc/haproxy/haproxy.cfg

sudo service haproxy start
