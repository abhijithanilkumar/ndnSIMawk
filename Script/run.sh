#Script that runs the Awk

cd ../Files/
awk -f ../Script/cache.awk fifo.txt lru.txt lfu.txt random.txt
