namespace :ut do
  desc "TODO"
  task import: :environment do
    require "#{Rails.root}/lib/helpers/game_log"
    include GameLog

    logfile = 'games.log'
    games = parse_gamelog
    Game.import_games games
    p games
  end

  desc "TODO"
  task gamestate: :environment do
  end

end
