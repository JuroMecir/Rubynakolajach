class CreateFishIds < ActiveRecord::Migration[5.2]
  def change
    create_table :fish_ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
