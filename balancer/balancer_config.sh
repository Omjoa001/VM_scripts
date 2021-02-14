#!/usr/bin/env bash
set -x

# configuration for installing haproxy, copying haproxy.cfg, etc goes here

sudo apt-get update -y
sudo apt-get install haproxy net-tools -y

# MANAGER=192.168.128.142
# scp ubuntu@$MANAGER:~/dcsg2003-scripts/haproxy.cfg /etc/haproxy/haproxy.cfg
haproxy -c -f /etc/haproxy/haproxy.cfg

sudo service haproxy start
