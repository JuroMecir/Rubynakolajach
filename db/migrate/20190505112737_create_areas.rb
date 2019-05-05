class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :number
      t.integer :acreage
      t.references :owner, foreign_key

      t.timestamps
    end
  end
end
