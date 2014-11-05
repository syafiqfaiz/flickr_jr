class CreateUsers < ActiveRecord::Migration
  def change
   create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email

      t.timestamp
    end
    add_index :users, :email , unique: true
  end
end
