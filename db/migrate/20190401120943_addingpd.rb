class Addingpd < ActiveRecord::Migration[5.2]
  def change
   # add_index :users, :email, unique: true
    remove_column :users, :password
    add_column :users, :password_digest ,:string
  end
end
