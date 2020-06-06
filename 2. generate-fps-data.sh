#!/bin/bash
FILE=$1
FILE=${FILE:-"merge.log"}
egrep -a 'dvrcore\]\[M.*\[CAMERA\] fps = ' ${FILE} | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $14)}' > fps-main-camera.dat
egrep -a 'dvrcore\]\[S.*\[CAMERA\] fps = ' ${FILE} | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $14)}' > fps-2nd-camera.dat
egrep -a 'dvrcore\]\[M.*\[VIDEO ENCODER\]\[0\].*fps = ' ${FILE} | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $15)}' > fps-main-video.dat
egrep -a 'dvrcore\]\[S.*\[VIDEO ENCODER\]\[0\].*fps = ' ${FILE} | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $15)}' > fps-2nd-video.dat
egrep -a ThermalCon.*CPU ${FILE} | awk -F" " '{printf ("2020-%s_%s %s %s %s\n", $1, $2, $7, $8, $9)}' | sed -e "s/,//g" | sed -e "s/CPU=//g" | sed -e "s/LCD=//g" | sed -e "s/MEM=//g" > temp.dat