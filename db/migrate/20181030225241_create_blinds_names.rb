class CreateBlindNames < ActiveRecord::Migration[5.2]
  def change
    create_table :blind_names do |t|
      t.string :blinds

      t.timestamps
    end
  end
end
