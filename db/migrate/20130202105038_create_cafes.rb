class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.string :id
      t.string :name
      t.string :image
      t.text :location
      t.integer :herenow
      t.boolean :full

      t.timestamps
    end
  end
end
