#!/usr/bin/env bash

# WIP
# Should prolly loop through a list of servers of something to check if they all exist
# How to get the list of servers, though? Hard coded variable?

set -x

SERVERS="openstack server list | tail -n +4 | sed '$ d'  | awk '{print $4}'"

