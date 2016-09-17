BEGIN{

    for(i=1;i<ARGC;++i)
    {
      file_name[i] = ARGV[i]
      random_hit[i] = int(0)
      random_miss[i] = int(0)
      print file_name[i]
    }
    results = "random_benchmark.txt"
    i = 1
}

{

    for(i=1;i<ARGC;++i)
        if(FILENAME == file_name[i])
            current = i
    #Random
    if(FILENAME == file_name[current])
    {
        if($3 == "CacheHits")
            random_hit[current] += int($4)
        if($3 == "CacheMisses")
            random_miss[current] += int($4)
    }

}

END{

  print "CacheSize  Random\n" > results
  print 0," ",0,"\n" > results
  for(i=1;i<ARGC;++i)
  {
    print random_hit[i]," ",random_miss[i]
    print (i*50)," ",(random_hit[i]/(random_hit[i]+random_miss[i])),"\n" > results
  }

}
