#!/usr/bin/env bash 
set -x

# Creates a balancer vm.

# Image:  Ubuntu Server 18.04 LTS (Bionic Beaver) amd64
# Flavor: m1.tiny
# Not sure if the file flag works, but the intention is to inject the haproxy conf into the vm.

DIR=~/dcsg2003-scripts/balancer

openstack server create \
	--image 1676adb4-9657-42ed-b31f-b3907cbcd697 \
	--flavor 3d0d6b55-971e-4fe6-9c90-f9c059ff70ca \
	--key-name manager \
	--user-data $DIR/config_scripts/balancer_config.sh \
	--file /etc/haproxy/haproxy.cfg=$DIR/haproxy.cfg \
	balancer 

sleep 30 # is this necessary?

openstack server add floating ip balancer 10.212.138.40 


