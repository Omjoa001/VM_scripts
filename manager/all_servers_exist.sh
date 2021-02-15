#!/usr/bin/env bash

set -x

SERVERS="openstack server list | tail -n +4 | sed '$ d'  | awk '{print $4}'"

