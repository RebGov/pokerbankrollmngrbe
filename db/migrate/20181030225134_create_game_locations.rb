class CreateGameLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :game_locations do |t|
      t.string :poker_room
      t.timestamps
    end
  end
end
