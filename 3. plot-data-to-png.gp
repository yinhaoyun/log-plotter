TimeFormat = "%Y-%m-%d_%H:%M:%S"
stats "temp.dat" u (strptime(TimeFormat, strcol(1))):2
load 'settings.gp'
set terminal pngcairo size 1920,1080 enhanced font 'Verdana,10'

set title "Camera FPS History"
set output "camera-fps.png"
plot "fps-main-camera.dat" using 1:2 title "Main Camera" ls 1, \
		"fps-2nd-camera.dat" using 1:2 title "2nd Camera" ls 2

set title "Video FPS History"
set output "video-fps.png"
plot "fps-main-video.dat" using 1:2 title "Main Video" ls 4, \
		"fps-2nd-video.dat" using 1:2 title "2nd Video" ls 5

set ytics nomirror
set y2tics
set y2range [50:100]
set y2label "Temperature" . ", Max CPU T = " . sprintf("%1.1f", STATS_max_y)
set title "Video FPS & CPU Temp History"
set output "fps-temp.png"
plot "fps-main-video.dat" using 1:2 title "Main Video" ls 4, \
		"fps-2nd-video.dat" using 1:2 title "2nd Video" ls 5, \
		"temp.dat" every 30 using 1:2 smooth mcsplines title "CPU" ls 3 with lines axes x1y2