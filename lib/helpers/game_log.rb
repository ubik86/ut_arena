module GameLog
  def import_gamelog(logfile)
    path = Dir.pwd + '/public/' + logfile
    file = File.open(path,'r')

    stat = []
    stats = []
    log = false
    k = 0

    file.readlines.each do |line|

      if line =~ /Exit/
        log = true
        next
      end

      if log and line =~ /ClientSpawn/
        log = false

        stat[k] = stats
        stats = []
        k += 1
      end

      stats << line if log

    end

    stat
  end


  def parse_gamelog
    stats = import_gamelog('games1.log')
    games = Array.new

    k = 0

    stats.each do |st|
      cfg = sample_cfg

      cfg[:teams][:red] = st[0].match(/(red).(\d+)/)[2]
      cfg[:teams][:blue] = st[0].match(/(blue).(\d+)/)[2]

      st[1..-1].each do |l|
        score = l.match(/(score). (\d+)/)[2]   
        player = l.match(/(client). (\d+)\s([\w]+)/)[3]
        cfg[:players][player.to_sym] = score
      end

      games << cfg
      k += 1
    end
  
    return games
  end


  def sample_cfg
    {teams: {red: 0, blue: 0}, players: {}}
  end

end