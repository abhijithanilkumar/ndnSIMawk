BEGIN{

    for(i=1;i<ARGC;++i)
    {
      file_name[i] = ARGV[i]
      fifo_hit[i] = int(0)
      fifo_miss[i] = int(0)
      print file_name[i]
    }
    results = "fifo_benchmark.txt"
    i = 1
}

{

    for(i=1;i<ARGC;++i)
        if(FILENAME == file_name[i])
            current = i
    #FIFO
    if(FILENAME == file_name[current])
    {
        if($3 == "CacheHits")
            fifo_hit[current] += int($4)
        if($3 == "CacheMisses")
            fifo_miss[current] += int($4)
    }

}

END{

  print "CacheSize  FIFO\n" > results
  print 0," ",0,"\n" > results
  for(i=1;i<ARGC;++i)
  {
    print fifo_hit[i]," ",fifo_miss[i]
    print (i*100)," ",(fifo_hit[i]/(fifo_hit[i]+fifo_miss[i])),"\n" > results
  }

}
