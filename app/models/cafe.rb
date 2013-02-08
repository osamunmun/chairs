class Cafe < ActiveRecord::Base
  attr_accessible :venue_id, :full, :herenow, :image, :location, :name
  alias_attribute :vid, :venue_id
  alias_attribute :now, :herenow

  def full?
    full
  end
end
