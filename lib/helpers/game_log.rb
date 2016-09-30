module GameLog
  def import_gamelog(logfile)
    path = Dir.pwd + '/public/' + logfile
    file = File.open(path,'r')

    stats = []
    log = false

    file.readlines.each do |line|
      if line =~ /Exit/
        log = true
        next
      end

      if log and line =~ /ClientSpawn/
        log = false
        break
      end

      stats << line if log

    end

    stats
  end


  def results(config)
    stat = import_gamelog('games.log')
    cfg = config


    cfg[:teams][:red] = stat[0].match(/(red).(\d+)/)[2]
    cfg[:teams][:blue] = stat[0].match(/(blue).(\d+)/)[2]

    stat[1..-1].each do |l|
      score = l.match(/(score). (\d+)/)[2]   
      player = l.match(/(client). (\d+)\s([\w]+)/)[3]
      cfg[:players][player.to_sym] = score
    end

    cfg
  end


  def sample_cfg
    {teams: {red: 0, blue: 0}, players: {}}
  end



end