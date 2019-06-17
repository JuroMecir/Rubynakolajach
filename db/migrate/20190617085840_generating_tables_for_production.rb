class GeneratingTablesForProduction < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :name

      t.timestamps
    end

    create_table :baits do |t|
      t.string :name

      t.timestamps
    end

    create_table :methodfs do |t|
      t.string :name

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :areas do |t|
      t.string :name
      t.string :number
      t.integer :acreage
      t.string :owner
      t.string :region

      t.timestamps
    end

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
