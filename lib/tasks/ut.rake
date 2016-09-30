namespace :ut do
  desc "TODO"
  task import: :environment do
    require "#{Rails.root}/lib/helpers/game_log"
    include GameLog

    logfile = 'games.log'
    stat = results(sample_cfg)
    p stat
  end

  desc "TODO"
  task gamestate: :environment do
  end

end
