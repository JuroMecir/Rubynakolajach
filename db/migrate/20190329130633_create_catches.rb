class CreateCatches < ActiveRecord::Migration[5.2]
  def change
    create_table :catches do |t|
      t.integer :size
      t.integer :weight
      t.timestamps
      t.references :user, foreign_key: true
    end

  end
end
