class Cafe < ActiveRecord::Base
  attr_accessible :venue_id, :full, :herenow, :image, :location, :name
end
