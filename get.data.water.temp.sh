#!/bin/bash

IP=192.168.1.11

date=`date --iso-8601=seconds`
water_temp_event=`curl http://$IP/ -s  | tail -n1 | cut -d' '  -f 7`

#for logging purposes -> ELK
echo "$date, $water_temp_event" >> /var/log/watersolarpanel/water_events.`date -I`.log
