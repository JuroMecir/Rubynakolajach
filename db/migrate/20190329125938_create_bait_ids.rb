class CreateBaitIds < ActiveRecord::Migration[5.2]
  def change
    create_table :bait_ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
