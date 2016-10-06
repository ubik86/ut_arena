class ImportGame < ApplicationRecord
  require "#{Rails.root}/lib/helpers/game_log"
  include GameLog

  mount_uploaders :game_logs, GameLogUploader
  has_many :games

  after_save :import_games

  private
  def import_games
    path = self.game_logs[0].current_path
    games = parse_gamelog(path)
    Game.import_games(games)
  end

end
