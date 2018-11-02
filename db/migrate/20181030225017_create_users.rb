class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :username
      t.boolean :read_and_accepted_terms_of_service


      t.timestamps
    end
  end
end
