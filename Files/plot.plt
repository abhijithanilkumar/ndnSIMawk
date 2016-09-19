iext = ".txt"

set term png
oext = ".png"

text = "'Verdana,10'"

iput = "../Script/benchmarks.txt"
oput = "./gnuplot_graph.png"

set xtics 200

set output oput
set xlabel "Cache Size"
set ylabel "Hit Ratio"
set title "Cache Size Vs Hit Ratio"
set key outside
set style function linespoints
set style line 10

plot for [i=2:n+1] iput u 1:i with linespoints title columnheader(i)
