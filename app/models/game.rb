class Game < ApplicationRecord
  has_many :scores

  def self.imported_game(game)
    game_obj = self.new
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
    game_obj.save
  end
end
