# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


game = {:teams=>{:red=>122, :blue=>77}, :players=>{:Krzyszti=>78, :rafal=>44, :btr=>33}}
Game.new.import_game(game)
