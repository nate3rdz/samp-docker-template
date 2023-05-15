#!/bin/bash

# start.sh
# samp-server-docker entrypoint 
# by krusty / 15. 1. 2020

#trap "cd /mnt; rm -rf ${HOSTNAME}" SIGINT

exec ./samp03svr
