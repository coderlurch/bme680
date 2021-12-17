#!/bin/bash
DB=/home/pi/Projects/bme680/bme680.rrd
TEMP=$(/usr/bin/python3 /home/pi/Projects/bme680/read_from.py \
192.168.0.31 T P H G)
/usr/bin/rrdtool update $DB N:$TEMP
