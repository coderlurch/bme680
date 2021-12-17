#!/bin/bash
S=$1
DB=/home/pi/Projects/bme680/bme680.rrd
PICDIR=/home/pi/public_html/bme680
/usr/bin/rrdtool graph $PICDIR/temperature${S}.png -s $S \
-w 800 -h 200 \
-t "Temperature" -v "T [C]" -l 16 -u 26 -r \
DEF:t0=$DB:T:AVERAGE LINE1:t0#FF0000:"Temperature";
