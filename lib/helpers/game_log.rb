module GameLog
  def import_gamelog(logfile)
    file = File.open(logfile,'r')

    stat = []
    stats = []
    user_stat = []
    user_stats = []
    game_setting = []
    game_settings = []
    log = false
    k = 0

    file.readlines.each do |line|

      if line =~ /Exit/
        log = true
        user_stat[k] = user_stats
        user_stats = []
        game_settings[k] = game_setting
        game_setting = []
        next
      end

      if line =~ /ClientUserinfoChanged/
        user_stats << line
        next
      end

      if line =~ /InitGame/
        user_stats = []
        game_setting = line
      end

      if log and line =~ /ClientSpawn/
        log = false

        stat[k] = stats
        stats = []
        k += 1
      end

      stats << line if log

    end
    [stat, user_stat, game_settings]
  end


  def parse_gamelog(path)
    stats, user_stats, game_settings = import_gamelog(path)
    games = Array.new

    k = 0

    stats.each do |st|
      cfg = ffa_cfg

      red = st[0].match(/(red).(\d+)/)[2]
      blue = st[0].match(/(blue).(\d+)/)[2]

      if red and blue
        cfg = ctf_cfg
        cfg[:red][:score] = red
        cfg[:blue][:score] = blue
      end

      st[1..-1].each do |l|
        team = 0

        score = l.match(/(score). (\d+)/)[2]
        player = l.match(/(client). (\d+)\s([\w]+)/)[3]

        user_stats[k].each do |info|
          if info =~ /#{player}/
            team = info.match(/\\t\\(.)/)[0][3]
          end
        end
        if team == '1'
          cfg[:red][:players][player.to_sym] = score
        elsif team == '2'
          cfg[:blue][:players][player.to_sym] = score
        else
          cfg[:players][player.to_sym] = score
        end

        map = game_settings[k].match(/mapname\\.*\\sv/)[0][8..-4]
        cfg[:map] = map
      end

      games << cfg
      k += 1
    end
    puts games
    games
  end


  def ctf_cfg
    {red: {players: {}, score: 0}, blue: {players: {}, score: 0}, map: ''}
  end

  def ffa_cfg
    {players: {}, map: ''}
  end

end
