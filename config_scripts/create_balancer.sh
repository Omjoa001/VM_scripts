#!/usr/bin/env bash

# Creates a balancer vm

# WIP

openstack server create \
	--flavor 3d0d6b55-971e-4fe6-9c90-f9c059ff70ca \  # m1.tiny
	--image  1676adb4-9657-42ed-b31f-b3907cbcd697 \  # Ubuntu Server 18.04 LTS (Bionic Beaver) amd64
	--key-name manager \
	--file ./balancer_config.sh \ 		 	 # Installs haproxy n stuff
	balancer

openstack server add floating ip balancer 10.212.138.40 

