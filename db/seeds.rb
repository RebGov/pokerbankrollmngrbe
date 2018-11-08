# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.destroy_all
PlayedGame.destroy_all
GameName.destroy_all
GameLocation.destroy_all
BlindsName.destroy_all
User.destroy_all



#user
becci = User.create(email: '1@example.com', password: '123456', first_name: 'Becci', last_name: 'Govert', username: '1')
jennifer = User.create(email: 'jennifer@email.com', password: 'jennifer123', first_name: 'Jennifer', last_name: 'Bartlet', username: 'jenbart' )
#game-name
omaha08 = GameName.create(game_title: 'Omaha08')
plo = GameName.create(game_title: 'plo')

# game-location
bellagio = GameLocation.create(place: 'Bellagio')
prime = GameLocation.create(place: 'Prime Social')

#blinds
tentwenty = BlindsName.create(blinds: '10/20')
twentyforty = BlindsName.create(blinds: '20/40')
#game-played
game1 = PlayedGame.create(user: becci, game_name: plo, game_location: bellagio, blinds_name: tentwenty, start_date_time: "2018-01-01 09:00:00", end_date_time: "2018-01-02 10:00:00", buy_in: 100, cash_out: 200, minutes: 60, won_game: true, tournament: false,  profit: 100)
game2 = PlayedGame.create(user: jennifer, game_name: omaha08, game_location: prime, blinds_name: twentyforty, start_date_time: "2018-02-01 09:00:00", end_date_time: "2018-02-02 10:00:00", buy_in: 200, cash_out: 400, minutes: 60, won_game: true, tournament: false, profit: 200)
#notes()
note1 = Note.create(note: 'This is a note', played_game: game1)
note2 = Note.create(note: 'This is note 2', played_game: game1)
