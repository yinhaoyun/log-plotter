set xdata time
TimeFormat = "%Y-%m-%d_%H:%M:%S"
set timefmt TimeFormat
set xlabel "Time"
set ylabel "FPS"
set format x "%H:%M"
set border linewidth 2
set grid
set samples 1000
set style function linespoints
set style line 1 lt 1 lc rgb "blue" lw 1
set style line 2 lt 1 lc rgb "green" lw 1
set style line 3 lt 1 lc rgb "red" lw 1 #CPU
set style line 4 lt 2 lc rgb "navy" lw 1
set style line 5 lt 2 lc rgb "olive" lw 1
set style line 6 lt 2 lc rgb "purple" lw 1
set style line 7 lt 2 lc rgb "cyan" lw 1

set yrange [0:30]

set key right bottom
set title "FPS History"
