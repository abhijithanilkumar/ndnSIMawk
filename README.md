# ndnSIMawk
Awk Script to compute the cache hit ratio in NDN Content Store!

## Usage :

1. Move to the ```Files/``` folder.
2. Type the following command : 
```bash
awk -f ../Script/cache.awk <filename_1> <filename_2> <filename_3> <filename_4> <filename_5>
```
Where,
```
filename_1 = fifo.txt
filename_2 = lru.txt
filename_3 = lfu.txt
filename_4 = nocache.txt
filename_5 = random.txt
```
One or more files can be omitted. File names are illustrative. Names can change but the file should contain the CS_Tracer simulation result of the algorithm mentioned.

The results are stored in the ```Benchmarking.txt``` file. Hit Ratio of each algorithm is computed!



## Results using Icarus

The results for different cache replacement algorithms plotted using Icarus are available [here](https://github.com/cjamadagni/Icarus_scripts).
