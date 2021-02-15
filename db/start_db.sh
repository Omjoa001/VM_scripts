
#!/bin/env bash

set -x

DB1=192.168.132.33

# This seems to work, but it throws a warning because of --insecure 
ssh $DB1 sudo cockroach start --insecure --store=/bfdata --listen-addr=0.0.0.0:26257 --http-addr=0.0.0.0:8080 --background --join=localhost:26257

# Not sure if this is needed. The script usually halts when it reaches this line
# ssh $DB1 sudo cockroach init --insecure --host=localhost:26257

