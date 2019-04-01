class CreateTimeIds < ActiveRecord::Migration[5.2]
  def change
    create_table :time_ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
