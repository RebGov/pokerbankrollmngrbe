class CreateBlindsNames < ActiveRecord::Migration[5.2]
  def change
    create_table :blinds_names do |t|
      t.string :blinds

      t.timestamps
    end
  end
end
