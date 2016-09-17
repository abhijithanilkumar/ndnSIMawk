BEGIN{

    for(i=1;i<ARGC;++i)
    {
      file_name[i] = ARGV[i]
      lfu_hit[i] = int(0)
      lfu_miss[i] = int(0)
      print file_name[i]
    }
    results = "lfu_benchmark.txt"
    i = 1
}

{

    for(i=1;i<ARGC;++i)
        if(FILENAME == file_name[i])
            current = i
    #LFU
    if(FILENAME == file_name[current])
    {
        if($3 == "CacheHits")
            lfu_hit[current] += int($4)
        if($3 == "CacheMisses")
            lfu_miss[current] += int($4)
    }

}

END{

  print "CacheSize  LFU\n" > results
  print 0," ",0,"\n" > results
  for(i=1;i<ARGC;++i)
  {
    print lfu_hit[i]," ",lfu_miss[i]
    print (i*50)," ",(lfu_hit[i]/(lfu_hit[i]+lfu_miss[i])),"\n" > results
  }

}
