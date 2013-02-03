class CreateHerenows < ActiveRecord::Migration
  def change
    create_table :herenows do |t|
      t.integer :herenow
      t.string :venue_id

      t.timestamps
    end
  end
end
