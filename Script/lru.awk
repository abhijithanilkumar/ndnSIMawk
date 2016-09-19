BEGIN{

    for(i=1;i<ARGC;++i)
    {
      file_name[i] = ARGV[i]
      lru_hit[i] = int(0)
      lru_miss[i] = int(0)
      print file_name[i]
    }
    results = "lru_benchmark.txt"
    i = 1
}

{

    for(i=1;i<ARGC;++i)
        if(FILENAME == file_name[i])
            current = i
    #LRU
    if(FILENAME == file_name[current])
    {
        if($3 == "CacheHits")
            lru_hit[current] += int($4)
        if($3 == "CacheMisses")
            lru_miss[current] += int($4)
    }

}

END{

  print "CacheSize  LRU\n" > results
  print 0," ",0,"\n" > results
  for(i=1;i<ARGC;++i)
  {
    print lru_hit[i]," ",lru_miss[i]
    print (i*200)," ",(lru_hit[i]/(lru_hit[i]+lru_miss[i])),"\n" > results
  }

}
