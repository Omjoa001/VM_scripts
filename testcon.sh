#!/bin/bash

# curl balancer every second to check if load balancing works.
while true; do curl 10.212.138.40; sleep 1; done
