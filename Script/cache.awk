BEGIN{
    file_name_1 = ARGV[1]
    file_name_2 = ARGV[2]
    file_name_3 = ARGV[3]
    file_name_4 = ARGV[4]
    file_name_5 = ARGV[5]
    results = "Benchmarking.txt"
    print file_name_1
    print file_name_2
    print file_name_3
    print file_name_4
    print file_name_5
    fifo_hit = 0
    fifo_miss = 0
    lru_hit = 0
    lru_miss = 0
    lfu_hit = 0
    lfu_miss = 0
    nocache_hit = 0
    nocache_miss = 0
    random_hit = 0
    random_miss = 0
}

{
    #FIFO
    if(FILENAME == file_name_1)
    {
        if($3 == "CacheHits")
            fifo_hit += $4
        if($3 == "CacheMisses")
            fifo_miss += $4

    }

    #LRU
    if(FILENAME == file_name_2)
    {
        if($3 == "CacheHits")
            lru_hit += $4
        if($3 == "CacheMisses")
            lru_miss += $4
    }

    #LFU
    if(FILENAME == file_name_3)
    {
        if($3 == "CacheHits")
            lfu_hit += $4
        if($3 == "CacheMisses")
            lfu_miss += $4
    }

    #NOCACHE
    if(FILENAME == file_name_4)
    {
        if($3 == "CacheHits")
            nocache_hit += $4
        if($3 == "CacheMisses")
            nocache_miss += $4
    }

    #RANDOM
    if(FILENAME == file_name_5)
    {
        if($3 == "CacheHits")
            random_hit += $4
        if($3 == "CacheMisses")
            random_miss += $4
    }
}

END{
    print nocache_hit
    printf " Algorithm     Hit/Miss Ratio \n" > results
    printf "  FIFO          %f%%      \n", (fifo_hit/fifo_miss)*100 > results
    printf "  LRU           %f%%      \n", (lru_hit/lru_miss)*100 > results
    printf "  LFU           %f%%      \n", (lfu_hit/lfu_miss)*100 > results
    printf "  NOCACHE       %f%%      \n", (nocache_hit/nocache_miss)*100 > results
    printf "  RANDOM        %f%%      \n", (random_hit/random_miss)*100 > results
}
