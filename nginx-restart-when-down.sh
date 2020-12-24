#!/bin/bash
date=$(date)
serv=nginx
sstat=Stopped
service $serv status | grep -i 'running\|stopped' | awk '{print $6}' | while read output;
do
echo $output
if [ "$output" == "$sstat" ]; then
    service $serv start
    echo "$serv service is UP now.! at $date" >> /home/ubuntu/restart-nginx.log
    else
    echo "$serv service is running"
    fi
done
