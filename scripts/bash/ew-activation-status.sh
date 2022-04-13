#!/bin/bash
for x in $(seq 1 100); do
       output=$(akamai ew status 5026 | awk 'NR==6{print $4}')
       echo ${output}
        if [[ $output = 'COMPLETE' ]]; then
                break
        fi
       sleep 60
done