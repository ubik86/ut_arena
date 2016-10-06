class Game < ApplicationRecord
  has_many :scores
  belongs_to :import_game

  def game_importer(game, import)
    game_obj = self
    
    if game.key?(:teams)
      # TODO game should have many teams, teams should have their scores
      # Team.create(ut_name: 'red', game: game_obj, score: game[:teams][:red])
      # Team.create(ut_name: 'blue', game: game_obj, score: game[:teams][:blue])
      Team.create(ut_name: 'red')
      Team.create(ut_name: 'blue')
    end
    game[:players].each do |player, score|
      player_obj = Player.find_by(ut_nick: player)
      unless player_obj
        # TODO remove team_id after refactoring in models
        player_obj = Player.create(ut_nick: player, team_id: 1)
      end
      Score.create(player: player_obj, game: game_obj, points: score)
    end
  end

  def self.games_importer(games, import)
    games.each do |game|
      game_obj = Game.new(import_game: import, date: Time.now)
      game_obj.game_importer(game, import)

      game_obj.name = "Import_#{import.class.all.size + 1}_#{Date.today.to_s}"
      game_obj.save
    end
  end

end
