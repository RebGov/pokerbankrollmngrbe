class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :note
      t.belongs_to :played_game

      t.timestamps
    end
  end
end
