class CreateGameNames < ActiveRecord::Migration[5.2]
  def change
    create_table :game_names do |t|
      t.string :game_title

      t.timestamps
    end
  end
end
