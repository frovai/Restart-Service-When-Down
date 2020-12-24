#!/bin/bash
date=$(date)
serv=php5.6-fpm
sstat='(dead)'
service $serv status | grep -i 'running\|dead' | awk '{print $3}' | while read output;
do
echo $output
if [ "$output" == "$sstat" ]; then
    service $serv start
    echo "$serv service is UP now.! at $date" >> /home/ubuntu/restart-php-fpm.log
    else
    echo "$serv service php-fpm is running" >> /home/ubuntu/restart-php-fpm.log
    fi
done
