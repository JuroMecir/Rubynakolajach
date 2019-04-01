class CreateMethodIds < ActiveRecord::Migration[5.2]
  def change
    create_table :method_ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
