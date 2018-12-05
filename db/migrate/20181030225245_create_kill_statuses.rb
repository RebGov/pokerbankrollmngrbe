class CreateKillStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :kill_statuses do |t|
      t.string :kill

      t.timestamps
    end
  end
end
