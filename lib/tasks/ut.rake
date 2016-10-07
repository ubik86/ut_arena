namespace :ut do
  desc "TODO"
  task import: :environment do
    require "#{Rails.root}/lib/helpers/game_log"
    include GameLog

    logfile = 'games.log'
    path = Dir.pwd + '/public/' + logfile

    import = ImportGame.new
    games = parse_gamelog path
    Game.games_importer games, import
    p games
  end

  desc "TODO"
  task gamestate: :environment do
  end

end
