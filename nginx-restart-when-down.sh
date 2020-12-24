#!/bin/bash
date=$(date)
serv=nginx
sstat='(dead)'
service $serv status | grep -i 'running\|dead' | awk '{print $3}' | while read output;
do
echo $output
if [ "$output" == "$sstat" ]; then
    service $serv start
    echo "$serv service is UP now.! at $date" >> /home/ubuntu/restart-nginx.log
    else
    echo "$serv service nginx is running" >> /home/ubuntu/restart-nginx.log
    fi
done
