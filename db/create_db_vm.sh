#!/usr/bin/env bash
set -x

# WIP
# Script to create a database vm in case the existing one dies

## this script should
# 1. Create a vm with openstack commands
# 2. Install cockroach and dependencies
# 3. Load backup database
# 4. Start db

## this stuff also has to happen
# New vms get a new private IP. 
# 1. We need to check the new private ip address of the db vm
# 2. update config.php files with new ip
# 3. Rebuild the docker image with the modified config.php

## WIP ip address matching and replacing
# The ugly regex matches an IPv4 address
NEW_IP=$(openstack server list | grep db1 | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
OLD_IP=$(grep dbhost ~/bookface/config.php | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")

# Replace dbhost with new IP in config.php
sed "s/$dbhost = \"${OLD_IP}\";/$dbhost = \"${NEW_IP}\";/g" ~/bookface/config.php

