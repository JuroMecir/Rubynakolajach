class Repair < ActiveRecord::Migration[5.2]
  def change
    add_reference :catches, :fish_id,index: true, foreign_key: true
    add_reference :catches, :time_id,index: true, foreign_key: true
    add_reference :catches, :bait_id,index: true, foreign_key: true
    add_reference :catches, :method_id,index: true, foreign_key: true
    add_reference :catches, :user,index: true, foreign_key: true
    add_reference :catches, :area,index: true, foreign_key: true
    add_reference :areas,:owner,index: true, foreign_key: true
    remove_column :catches, :fish_ids_id
    remove_column :catches, :time_ids_id
    remove_column :catches, :bait_ids_id
    remove_column :catches, :method_ids_id
    remove_column :catches, :users_id
    remove_column :catches, :areas_id
    remove_column :areas, :owners_id
  end
end
