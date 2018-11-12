# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.destroy_all
PlayedGame.destroy_all
BlindsName.destroy_all
GameLocation.destroy_all
GameName.destroy_all
KillStatus.destroy_all
User.destroy_all

#users
exampleUser = User.create(email: '1@example.com', password: '123456', first_name: 'Example', last_name: 'One', username: '1')
exampleUsers =User.create([{ email: 'joe@example.com', password: '123456', first_name: 'Joe', last_name: 'Doe', username: 'joe' }, { email: 'jane@example.com', password: '123456', first_name: 'Jane', last_name: 'Doe', username: 'jane' }])

#gameName
gameName = GameName.create([{ game_title: 'Omaha 8' }, { game_title: 'Omaha' }, { game_title: 'Limit Holdem' }])

# game-location
gameLocations = GameLocation.create([{ poker_room: 'Bellagio' },{ poker_room: 'Prime Social' }, { poker_room: 'Borgata' }])

#blinds
blindsNames = BlindsName.create([{ blinds: '10/20' },{ blinds: '20/40' }])

# kill
kills = KillStatus.create([{ kill: 'none' }, { kill: 'half-kill' }, { kill: 'full-kill' }])


#playedGames
first = true
CSV.foreach("db/pd.csv") do |row|
 # use row here...

  if first
   first = false

 else

   na, buy_in, cash_out, na, start_date_time, end_date_time, room_of_poker_location, na, tournament_string, na, na, na, na, na, game_name, blinds_name, kill_status = row

   buy_in = buy_in[2..buy_in.length]
   cash_out = cash_out[2..cash_out.length]
   location = GameLocation.find_or_create_by(poker_room: room_of_poker_location)
   tournament = tournament_string != "cashgame"
   game_name = GameName.find_or_create_by(game_title: game_name )
   blinds_name = BlindsName.find_or_create_by(blinds: blinds_name)
   kill_status = KillStatus.find_or_create_by(kill: kill_status)
   PlayedGame.create(buy_in: buy_in.to_f, cash_out:cash_out.to_f, start_date_time: start_date_time , end_date_time: end_date_time, game_location: location, tournament: tournament, game_name: game_name, blinds_name: blinds_name, kill_status: kill_status, user: exampleUser )

 end
end

notes = Note.create([{ note: 'This is a note', played_game_id: 1 }, { note: 'This is note 2', played_game_id: 1 }, { note: 'This is a note', played_game_id: 14 }])


#########
#game-played
# game1 = PlayedGame.create(user: becci, game_name: plo, kill_status: none1, game_location: bellagio, blinds_name: tentwenty, start_date_time: "2018-01-01 09:00:00", end_date_time: "2018-01-02 10:00:00", buy_in: 100, cash_out: 200, minutes: 60, won_game: true, tournament: false,  profit: 100)
# game2 = PlayedGame.create(user: jennifer, game_name: omaha08, kill_status: none1, game_location: prime, blinds_name: twentyforty, start_date_time: "2018-02-01 09:00:00", end_date_time: "2018-02-02 10:00:00", buy_in: 200, cash_out: 400, minutes: 60, won_game: true, tournament: false, profit: 200)
# #notes()
# note1 = Note.create(note: 'This is a note', played_game: game1)
# note2 = Note.create(note: 'This is note 2', played_game: game1)
