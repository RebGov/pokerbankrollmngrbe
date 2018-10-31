1) master
*2) becciMaster - where all merges should go*
2) beginSchema - first take models, controllers, serializer, schema, seeds #860161d
3) beginSchema - 2 fixed schema and seeds added auth controllers #c495032
4) authorizationStart
 - added tournament_date; drop, create, migrate, reseed


--------NOTES -------------
User: id, email, password, first_name, last_name, username
played_game: user_id, game_location_id, game_name_id, notes_id, blinds_name_id, tournament_name_id, tournament:t/f

do i want a game to have many to many notes relationship?

tournament: f disables all tournament fields :
  tournament_name_id,
  tournament_placement,
  tournament_date_played
  **NEED ROI**
tournament: t disables all cash game only fields :
  start_date_time,
  end_date_time,
  blinds_name_id,
  minutes,
  game_name_id

cash and tournament both use:
  note_id,
  user_id,
  buy_in,
  cash_out,
  game_location_id,
  game_name_id?,
  profit,
  won_game t/f
