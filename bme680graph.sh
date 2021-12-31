#!/bin/bash
S=$1
DB=/home/pi/Projects/bme680/bme680.rrd
PICDIR=/home/pi/public_html
/usr/bin/rrdtool graph $PICDIR/temperature${S}.png -s $S \
-w 800 -h 200 \
-t "Temperature" -v "T [C]" -l 16 -u 26 -r \
DEF:t0=$DB:T:AVERAGE LINE1:t0#FF0000:"Temperature";
/usr/bin/rrdtool graph $PICDIR/pressure${S}.png -s $S \
-w 800 -h 200 \
-t "Pressure" -v "P [hPa]" -l 900 -u 1100 -r \
DEF:t0=$DB:P:AVERAGE LINE1:t0#FF0000:"Pressure";
/usr/bin/rrdtool graph $PICDIR/humidity${S}.png -s $S \
-w 800 -h 200 \
-t "Humidity" -v "H [%]" -l 0 -u 100 -r \
DEF:t0=$DB:H:AVERAGE LINE1:t0#FF0000:"Humidity";
/usr/bin/rrdtool graph $PICDIR/gas${S}.png -s $S \
-w 800 -h 200 \
-t "Gas" -v "G [kOhm]" -l 0 -u 100 -r \
DEF:t0=$DB:G:AVERAGE LINE1:t0#FF0000:"Gas";

