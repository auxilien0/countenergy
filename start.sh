#!/bin/bash
# timeout=${1:-86400};
timeout=120;
while true; do . ./data.sh $1 $2 $3 $4; date; sleep $timeout; done;
