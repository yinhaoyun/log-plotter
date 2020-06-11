#!/bin/bash

function pause(){
	read -n 1 -p "$*" INP
	if [ $INP != '' ] ; then
		echo -ne '\b \n'
	fi
}

FILE=$1
FILE=${FILE:-"merge.log"}
grep -Ea 'dvrcore\]\[M.*\[CAMERA\] fps = ' "${FILE}" | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $14)}' > fps-main-camera.dat
grep -Ea 'dvrcore\]\[S.*\[CAMERA\] fps = ' "${FILE}" | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $14)}' > fps-2nd-camera.dat
grep -Ea 'dvrcore\]\[M.*\[VIDEO ENCODER\]\[0\].*fps = ' "${FILE}" | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $15)}' > fps-main-video.dat
grep -Ea 'dvrcore\]\[S.*\[VIDEO ENCODER\]\[0\].*fps = ' "${FILE}" | awk -F" " '{printf ("2020-%s_%s %s\n", $1, $2, $15)}' > fps-2nd-video.dat
grep -Ea "ThermalCon.*CPU" "${FILE}" | awk -F" " '{printf ("2020-%s_%s %s %s %s\n", $1, $2, $7, $8, $9)}' | sed -e "s/,//g" | sed -e "s/CPU=//g" | sed -e "s/LCD=//g" | sed -e "s/MEM=//g" > temp.dat
python csv_converter.py | tee csv.dat

pause 'Press any key to continue...'
