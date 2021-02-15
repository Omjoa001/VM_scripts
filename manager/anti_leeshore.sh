#!/usr/bin/env bash
set -x -euo pipefail

## Anti-Leeshore
# Re-enable vms that have been shut down by leeshore
# WIP

# Check if vms are shut down
# If so, start the vm
# + Special case for database (need to start cockroach)

# We should have a list of disabled servers, so that
# the script doesn't restart things we have shut down on purpose
# But laziness -> hard coded if for now
#DISABLED=""

# Servers that are down
SHUTDOWN=$(openstack server list | grep SHUTOFF | awk '{print $4}')

for SERVER in $SHUTDOWN; do
    if [ "$SERVER" != "worker1" ] && [ "$SERVER" != "worker2" ]; then
        openstack server start $SERVER

        if [ "$SERVER" == "db1" ]; then
            sleep 30
            ../db/start_db.sh
        fi

        # We can add more special cases here
    fi
done
