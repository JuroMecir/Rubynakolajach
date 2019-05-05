class CreateCatches < ActiveRecord::Migration[5.2]
  def change
    create_table :catches do |t|
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true
      t.references :fish, foreign_key: true
      t.references :bait, foreign_key: true
      t.references :methodf, foreign_key: true
      t.integer :size
      t.integer :weight

      t.timestamps
    end
  end
end
