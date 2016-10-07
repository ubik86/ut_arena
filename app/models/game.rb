class Game < ApplicationRecord
  has_many :scores
  belongs_to :import_game

  def game_importer(game)
    game_obj = self
    
    if game.key?(:red) && game.key?(:blue)
      red = Team.create(ut_name: 'red', score: game[:red][:score], game: game_obj, team_id: :red)
      blue = Team.create(ut_name: 'blue', score: game[:blue][:score], game: game_obj, team_id: :blue)
    end

    {red: red, blue: blue}.each do |team, team_obj|
      game[team][:players].each do |player, score|
        team = team_obj

        player_obj = Player.where(ut_nick: player).first
        unless player_obj
          player_obj = Player.create(ut_nick: player, team: team)
        end
        Score.create(player: player_obj, game: game_obj, points: score, team: team)
      end
    end
  end

  def self.games_importer(games, import)
    games.each do |game|
      game_obj = Game.new(import_game: import, date: Time.now, ut_map: game[:map])
      game_obj.game_importer(game)

      game_obj.name = "#{game[:map]}_#{import.class.all.size}_#{Date.today.to_s}"
      game_obj.save
    end
  end

end
