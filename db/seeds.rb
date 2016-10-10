# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


t_import = 3
t_games = rand(1..5)
points= 30..100
players = %w(Krzyszti rafal btr master_of_disaster lahim ktoto? Kokoroko tpiDev)
maps = %w(ut4_riyad ut4_dressingroom ut4_prague)


puts "import: #{t_import}, games: #{t_games}\n\n"

t_import.times.each do |i|
  t_players = rand(6..8)
  red = players[0..3]
  blue = players[4..t_players]
  map = maps.shuffle.first
  games = []

  t_games.times.each do |j|
    temp = {red: {players: {}}, blue: {players: {}}, map: ''}

    {red: red, blue: blue}.each do |k,v|
      d = 0
      g = 0
      v.each do |p|
        g = rand(points) ;  d += g
        temp[k.to_sym][:players][p.to_sym] = g
      end
      temp[k.to_sym][:score] = d
    end

    temp[:map] = map

    games << temp
  end
  
  import = ImportGame.new
  Game.games_importer games, import
end