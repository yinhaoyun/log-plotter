TimeFormat = "%Y-%m-%d_%H:%M:%S"
stats "temp.dat" u (strptime(TimeFormat, strcol(1))):2
load 'settings.gp'

set ytics nomirror
set y2tics
set y2range [0:100]
set y2label "Temperature" . ", Max CPU T = " . sprintf("%1.1f", STATS_max_y)

plot "fps-main-camera.dat" using 1:2 ls 1 title "Main Camera", \
	"fps-2nd-camera.dat" using 1:2 ls 2 title "2nd Camera", \
	"fps-main-video.dat" using 1:2 ls 4 title "Main Video", \
	"fps-2nd-video.dat" using 1:2 ls 5 title "2nd Video", \
	"temp.dat" every 30 using 1:2 smooth mcsplines ls 3 title "CPU Temp" with lines axes x1y2, \
	"csv.dat" using 1:2 smooth mcsplines ls 6 title "CPU Loading" with lines axes x1y2, \
	"" using 1:3 smooth mcsplines ls 7 title "GPU Loading" with lines axes x1y2
