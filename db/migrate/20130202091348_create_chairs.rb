class CreateChairs < ActiveRecord::Migration
  def up
    create_table :chairs do |t|
      t.string :venues_id
      t.string :venues_name
      t.string :venues_image_url
      t.string :location
      t.integer :num_herenow
      t.integer :num_seats
      t.boolean :flg_full
    end
  end

  def down
  end
end
