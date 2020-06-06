load 'settings.gp'

set y2tics
set y2range [50:100]
plot "fps-main-camera.dat" using 1:2 ls 1 title "Main Camera", \
	"fps-2nd-camera.dat" using 1:2 ls 2 title "2nd Camera", \
	"fps-main-video.dat" using 1:2 ls 4 title "Main Video", \
	"fps-2nd-video.dat" using 1:2 ls 5 title "2nd Video", \
	"temp.dat" using 1:2 ls 3 title "CPU" with lines axes x1y2
