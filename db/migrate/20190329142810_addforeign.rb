class Addforeign < ActiveRecord::Migration[5.2]
  def change
    add_reference :catches, :fish_ids,index: true, foreign_key: true
    add_reference :catches, :time_ids,index: true, foreign_key: true
    add_reference :catches, :bait_ids,index: true, foreign_key: true
    add_reference :catches, :method_ids,index: true, foreign_key: true
    add_reference :catches, :users,index: true, foreign_key: true
    add_reference :catches, :areas,index: true, foreign_key: true
    add_reference :areas,:owners,index: true, foreign_key: true
    add_index :users, :email, unique: true
  end
end
