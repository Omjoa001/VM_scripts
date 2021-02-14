
#!/bin/env bash

DB1=192.168.132.33

# This hasn't been tested
ssh $DB1 sudo cockroach start --insecure --store=/bfdata --listen-addr=0.0.0.0:26257 --http-addr=0.0.0.0:8080 --background --join=localhost:26257
ssh $DB1 sudo cockroach init --insecure --host=localhost:26257

