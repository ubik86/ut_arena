class Game < ApplicationRecord
  has_many :scores
  belongs_to :import_game

  def game_importer(game)
    game_obj = self
    
    if game.key?(:teams)
      red = Team.create(ut_name: 'red', score: game[:teams][:red], game: game_obj)
      blue = Team.create(ut_name: 'blue', score: game[:teams][:blue], game: game_obj)
    end
    game[:players].each do |player, score|
      # TODO add team detection in game log import
      team = red

      player_obj = Player.where(ut_nick: player).first
      unless player_obj
        player_obj = Player.create(ut_nick: player, team: team)
      end
      Score.create(player: player_obj, game: game_obj, points: score, team: team)
    end
  end

  def self.games_importer(games, import)
    games.each do |game|
      game_obj = Game.new(import_game: import, date: Time.now)
      game_obj.game_importer(game)

      game_obj.name = "Import_#{import.class.all.size}_#{Date.today.to_s}"
      game_obj.save
    end
  end

end
