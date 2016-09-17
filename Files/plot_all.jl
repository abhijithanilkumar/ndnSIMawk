#Plot Graphs Using Gadfly
using DataFrames, Gadfly, Colors
data1 = readtable("../Script/benchmarks.txt", separator=' ')
n = size(keys(data1.colindex),1)-1
cols = distinguishable_colors(n, colorant"black")
algos = keys(data1.colindex)[2:end]
Gadfly.set_default_plot_size(12inch, 6inch)
p=Gadfly.plot([layer(data1, y=algos[i],x="CacheSize", Geom.smooth, Theme(default_color=cols[i],line_width=.8mm)) for i=1:n]..., Guide.XLabel("Cache Size"),
Guide.YLabel("Hit Ratio"),
Guide.Title("Cache Size vs Hit Ratio"),
Guide.manual_color_key("Legend", [replace(string(i),"_",".") for i in algos], cols))
draw(SVGJS("./graph_final.svg",15inch,12inch),p)
