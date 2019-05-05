class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :province

      t.timestamps
    end
  end
end
