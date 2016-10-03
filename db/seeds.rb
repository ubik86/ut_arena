# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teams = Team.create([{name: 'Szczupaki', ut_name: 'red'}, {name: 'Leszcze', ut_name: 'blue'}])
players = Player.create([{name: 'Wiktor', ut_nick: 'master_of_disaster', team: teams[0]}, {name: 'Bogus', ut_nick: 'btr', team: teams[0]}, {name: 'Jacek', ut_nick: 'Ktoto?', team: teams[1]}, {name: 'Krzysiek', ut_nick: 'Krzyszti', team: teams[1]}])

games = Game.create([{name: 'Riyad 1'}, {name: 'Riyad 2'}, {name: 'Riyad 3'}])