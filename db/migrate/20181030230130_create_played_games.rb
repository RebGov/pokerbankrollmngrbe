class CreatePlayedGames < ActiveRecord::Migration[5.2]
  def change
    create_table :played_games do |t|
      t.belongs_to :user, foreign_key: true
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.decimal :buy_in, precision: 15, scale:2
      t.decimal :cash_out, precision: 15, scale:2
      # t.integer :buy_in
      # t.integer :cash_out
      t.belongs_to :game_location, foreign_key: true
      t.belongs_to :game_name, foreign_key: true
      t.belongs_to :blinds_name, foreign_key: true
      t.belongs_to :kill_status, foreign_key: true
      t.boolean :tournament
      t.string :tournament_placement
      t.datetime :tournament_date
      t.string :tournament_name
      t.decimal :profit, precision: 15, scale:2
      # t.integer :profit
      t.integer :minutes
      t.boolean :won_game

      t.timestamps
    end
  end
end
