class CreateChairs < ActiveRecord::Migration
  def up
    create_table :chairs do |t|
      t.string :venues_id
      t.string :venues_name
      t.string :venues_image_url
      t.string :location
      t.integer :num_checkin
      t.integer :num_seats
      t.boolean :flg_full
      t.string :last_update
      end
  end

  def down
  end
end
