TimeFormat = "%Y-%m-%d_%H:%M:%S"
stats "temp.dat" u (strptime(TimeFormat, strcol(1))):2

load 'settings.gp'

set ytics nomirror
set y2tics
set y2range [0:100]

load 'time-setting.gp'
StartTime = strptime(TimeFormat, StartDateString."_".StartTimeString)
set xrange ["1970-01-01_00:00:00":"1970-01-01_" . Duration . ":00"]

set title "FPS History"
set xlabel "Time - from " . StartDateString . " " . StartTimeString . " for " . Duration
set y2label "Temperature" . ", Max CPU T = " . sprintf("%1.1f", STATS_max_y)

plot "fps-main-camera.dat" every 1 using ((timecolumn(1)-StartTime)):2 ls 1 title "Main Camera", \
	"fps-2nd-camera.dat" every 1 using ((timecolumn(1)-StartTime)):2 ls 2 title "2nd Camera", \
	"fps-main-video.dat" every 1 using ((timecolumn(1)-StartTime)):2 ls 4 title "Main Video", \
	"fps-2nd-video.dat" every 1 using ((timecolumn(1)-StartTime)):2 ls 5 title "2nd Video", \
	"temp.dat" every 30 using ((timecolumn(1)-StartTime)):2 smooth mcsplines ls 3 title "CPU Temp" with lines axes x1y2, \
	"csv.dat" using ((timecolumn(1)-StartTime)):2 ls 6 title "CPU Loading" with lines axes x1y2
