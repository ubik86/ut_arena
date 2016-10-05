class Game < ApplicationRecord
  has_many :scores
  has_many :teams, through: :scores

  def self.import_game(game)
    game_obj = self.new
    puts game
    if game.key?(:teams)
      red = Team.create(ut_name: 'red', score: game[:teams][:red])
      blue = Team.create(ut_name: 'blue', score: game[:teams][:blue])
    end
    game[:players].each do |player, score|
      player_obj = Player.where(ut_nick: player).first
      unless player_obj
        player_obj = Player.create(ut_nick: player)
      end
      # TODO add team detection in game log import
      team = red
      Score.create(player: player_obj, game: game_obj, points: score, team: team)
    end
    game_obj.save
  end
end
