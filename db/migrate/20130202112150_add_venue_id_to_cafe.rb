class AddVenueIdToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :venue_id, :string
  end
end
